import 'dart:async';

import 'package:flutter/services.dart';

class ConnectivityEventChannel {

  static const wifi = 0xFF;
  static const cellular = 0xEE;
  static const disconnected = 0xDD;
  static const unknown = 0xCC;

  StreamController<Connection?>? controller;

  reset(){
    controller?.sink.add(Connection.notListening);
    controller?.sink.close();
  }


  Stream stream = const EventChannel('platform_channel_events/connectivity')
      .receiveBroadcastStream()
      .distinct();

  listenTo(){
    controller = StreamController();

    stream.listen((event) {
      if(event != null){
        if(!(controller?.isClosed ?? true)) {
          controller?.sink.add(intToConnection(event as int));
        }
      }
    });
  }


  Connection intToConnection(int connectionInt) {
    var connection = Connection.unknown;
    switch (connectionInt) {
      case wifi:
        connection = Connection.wifi;
        break;
      case cellular:
        connection = Connection.cellular;
        break;
      case disconnected:
        connection = Connection.disconnected;
        break;
      default:
        connection = Connection.unknown;
        break;
    }
    return connection;
  }
}



/// Connection is an enum of supported network states
enum Connection {
  /// When connection state is [Constants.wifi]
  wifi,

  /// When connection state is [Constants.cellular]
  cellular,

  /// When connection state is [Constants.disconnected]
  disconnected,

  /// When connection state is [Constants.unknown]
  unknown,
  notListening,
}

