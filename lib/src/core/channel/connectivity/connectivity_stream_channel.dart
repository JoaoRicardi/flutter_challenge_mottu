import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';

class ConnectivityStreamChannel implements BaseStream<Connection?> {
  static const String instanceName = 'connectivity_stream';

  static const wifi = 0xFF;
  static const cellular = 0xEE;
  static const disconnected = 0xDD;
  static const unknown = 0xCC;

  final StreamController<Connection?> _controller = StreamController();

  @override
  StreamSubscription? subscription;

  bool _alreadyInit = false;

  final Stream _stream = const EventChannel('flutter_challenge/connectivity')
      .receiveBroadcastStream()
      .distinct();

  @override
  reset() {
    _controller.sink.add(null);
    subscription?.pause();
  }

  @override
  listenTo() {
    if (_alreadyInit) {
      subscription?.resume();
    } else {
      subscription = _stream.listen(null);

      subscription?.onData((data) {
        if (data != null) {
          _controller.sink.add(intToConnection(data as int));
        }
      });
    }

    _alreadyInit = true;
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

  @override
  Stream<Connection?> getStream() {
    return _controller.stream;
  }
}

enum Connection {
  wifi,
  cellular,
  disconnected,
  unknown,
  notListening,
}
