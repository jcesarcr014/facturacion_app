import 'package:flutter/services.dart';

class MsrService {
  static const EventChannel _eventChannel = EventChannel('com.antigravity.facturacion/msr');
  
  Stream<String> get onSwipe {
    return _eventChannel.receiveBroadcastStream().map((dynamic event) => event.toString());
  }
}
