package com.antigravity.facturacion.facturacion_app

import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import com.ctk.sdk.PosApiHelper

class MainActivity: FlutterActivity() {
    private val MSR_EVENT_CHANNEL = "com.antigravity.facturacion/msr"
    private var posApiHelper: PosApiHelper? = null
    private var msrThread: Thread? = null
    private var isReading = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        try {
            posApiHelper = PosApiHelper.getInstance()
            Log.d("MSR", "PosApiHelper initialized")
        } catch (e: Exception) {
            Log.e("MSR", "Failed to initialize PosApiHelper: ${e.message}")
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, MSR_EVENT_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    startMsrReading(events)
                }

                override fun onCancel(arguments: Any?) {
                    stopMsrReading()
                }
            }
        )
    }

    private fun startMsrReading(events: EventChannel.EventSink?) {
        if (posApiHelper == null || isReading) return
        isReading = true

        msrThread = Thread {
            try {
                val openRet = posApiHelper!!.McrOpen()
                Log.d("MSR", "McrOpen: $openRet")

                while (isReading) {
                    var temp = -1
                    while (temp != 0 && isReading) {
                        temp = posApiHelper!!.McrCheck()
                        Thread.sleep(200)
                    }

                    if (!isReading) break

                    val track1 = ByteArray(256)
                    val track2 = ByteArray(256)
                    val track3 = ByteArray(256)
                    
                    val ret = posApiHelper!!.McrRead(0.toByte(), 0.toByte(), track1, track2, track3)
                    Log.d("MSR", "McrRead ret: $ret")

                    if (ret > 0) {
                        posApiHelper!!.SysBeep()
                        var resultString = ""
                        
                        if ((ret and 1) == 1) {
                            resultString += String(track1).trim { it <= ' ' }
                        }
                        if ((ret and 2) == 2) {
                            val t2 = String(track2).trim { it <= ' ' }
                            if (resultString.isNotEmpty()) resultString += "?"
                            resultString += t2
                        }
                        if ((ret and 4) == 4) {
                            val t3 = String(track3).trim { it <= ' ' }
                            if (resultString.isNotEmpty()) resultString += "?"
                            resultString += t3
                        }

                        runOnUiThread {
                            events?.success(resultString)
                        }
                        break
                    } else {
                        Log.e("MSR", "Error reading tracks")
                        Thread.sleep(500)
                    }
                }
            } catch (e: Exception) {
                Log.e("MSR", "Exception in MSR Thread", e)
                runOnUiThread {
                    events?.error("MSR_ERROR", e.message, null)
                }
            } finally {
                posApiHelper!!.McrClose()
                isReading = false
            }
        }
        msrThread?.start()
    }

    private fun stopMsrReading() {
        isReading = false
        msrThread?.interrupt()
        msrThread = null
        try {
            posApiHelper?.McrClose()
        } catch (e: Exception) {
            Log.e("MSR", "Error closing MSR: ${e.message}")
        }
    }

    override fun onDestroy() {
        stopMsrReading()
        super.onDestroy()
    }
}
