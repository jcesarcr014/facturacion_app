package com.antigravity.facturacion.facturacion_app

import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import com.ctk.sdk.PosApiHelper
import android.nfc.NfcAdapter
import android.nfc.Tag
import android.nfc.tech.NfcA
import android.nfc.tech.NfcB
import android.nfc.tech.NfcF
import android.nfc.tech.NfcV
import android.nfc.tech.IsoDep
import android.nfc.tech.MifareClassic
import android.nfc.tech.MifareUltralight

class MainActivity: FlutterActivity() {
    private val MSR_EVENT_CHANNEL = "com.antigravity.facturacion/msr"
    private val NFC_EVENT_CHANNEL = "com.antigravity.facturacion/nfc"
    
    private var posApiHelper: PosApiHelper? = null
    private var msrThread: Thread? = null
    private var isReading = false
    
    private var nfcThread: Thread? = null
    private var isNfcReading = false
    private var nfcAdapter: NfcAdapter? = null
    private var nfcEventSink: EventChannel.EventSink? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        try {
            posApiHelper = PosApiHelper.getInstance()
            Log.d("POS", "PosApiHelper initialized")
        } catch (e: Exception) {
            Log.e("POS", "Failed to initialize PosApiHelper: ${e.message}")
        }
        nfcAdapter = NfcAdapter.getDefaultAdapter(this)
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

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, NFC_EVENT_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    startNfcReading(events)
                }

                override fun onCancel(arguments: Any?) {
                    stopNfcReading()
                }
            }
        )
    }
    
    // --- MSR METHODS ---
    private fun startMsrReading(events: EventChannel.EventSink?) {
        if (posApiHelper == null || isReading) return
        isReading = true

        msrThread = Thread {
            try {
                posApiHelper!!.McrOpen()
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
                    if (ret > 0) {
                        posApiHelper!!.SysBeep()
                        var resultString = ""
                        
                        if ((ret and 1) == 1) resultString += String(track1).trim { it <= ' ' }
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

                        runOnUiThread { events?.success(resultString) }
                        break
                    } else {
                        Thread.sleep(500)
                    }
                }
            } catch (e: Exception) {
                runOnUiThread { events?.error("MSR_ERROR", e.message, null) }
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
        try { posApiHelper?.McrClose() } catch (e: Exception) {}
    }

    // --- NFC METHODS ---
    private fun bytesToHex(bytes: ByteArray, length: Int): String {
        val hexChars = CharArray(length * 2)
        val hexArray = "0123456789ABCDEF".toCharArray()
        for (j in 0 until length) {
            val v = bytes[j].toInt() and 0xFF
            hexChars[j * 2] = hexArray[v ushr 4]
            hexChars[j * 2 + 1] = hexArray[v and 0x0F]
        }
        return String(hexChars)
    }

    private fun startNfcReading(events: EventChannel.EventSink?) {
        if (posApiHelper == null || isNfcReading) return
        isNfcReading = true

        nfcThread = Thread {
            try {
                posApiHelper!!.PiccOpen()
                
                // Demo app uses 'w' or 'M' or 'A'. We will try 'M' (Mifare), 'A' (Type A), 'B' (Type B), 'w' (All), and 0 (Generic).
                val modesToTry = byteArrayOf('M'.code.toByte(), 'A'.code.toByte(), 'w'.code.toByte(), 0.toByte(), 1.toByte())
                
                while (isNfcReading) {
                    var successRet = -1
                    var activeMode: Byte = 0
                    val cardType = ByteArray(2)
                    val uid = ByteArray(10)
                    
                    for (mode in modesToTry) {
                        if (!isNfcReading) break
                        uid.fill(0) // Clear buffer
                        val ret = posApiHelper!!.PiccCheck(mode, cardType, uid)
                        if (ret >= 0) {
                            // Check if uid actually has data (not purely zeroes)
                            if (!uid.all { it == 0.toByte() }) {
                                successRet = ret
                                activeMode = mode
                                break
                            }
                        }
                        Thread.sleep(50)
                    }
                    
                    if (successRet >= 0 && !uid.all { it == 0.toByte() }) {
                        posApiHelper!!.SysBeep()
                        
                        val rawUid = bytesToHex(uid, 10)
                        val rawCardType = bytesToHex(cardType, 2)
                        Log.e("NFC_DEBUG", "Detected! ret=$successRet mode=$activeMode")
                        Log.e("NFC_DEBUG", "RAW UID: $rawUid")
                        Log.e("NFC_DEBUG", "RAW TYPE: $rawCardType")
                        
                        var uidHex = rawUid
                        while (uidHex.endsWith("00") && uidHex.length > 8) {
                            uidHex = uidHex.substring(0, uidHex.length - 2)
                        }
                        
                        runOnUiThread { events?.success(uidHex) }
                        break
                    }
                    Thread.sleep(200)
                }
            } catch (e: Exception) {
                runOnUiThread { events?.error("NFC_ERROR", e.message, null) }
            } finally {
                posApiHelper!!.PiccClose()
                isNfcReading = false
            }
        }
        nfcThread?.start()
    }

    private fun stopNfcReading() {
        if (!isNfcReading) return
        isNfcReading = false
        nfcEventSink = null
        
        nfcThread?.interrupt()
        nfcThread = null
        try { posApiHelper?.PiccClose() } catch (e: Exception) {}
    }

    override fun onDestroy() {
        stopMsrReading()
        stopNfcReading()
        super.onDestroy()
    }
}
