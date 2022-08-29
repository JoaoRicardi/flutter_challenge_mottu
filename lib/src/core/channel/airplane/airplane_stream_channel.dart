import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_method_channel.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';

class AirPlaneStreamChannel implements BaseStream<AirplaneMode?> {
  final IAirPlaneMethodChannel methodChannel;

  static const String instanceName = 'airplane_stream';

  AirPlaneStreamChannel(this.methodChannel);

  final StreamController<AirplaneMode?> _controller = StreamController();

  bool _alreadyInit = false;

  @override
  StreamSubscription? subscription;

  final Stream _stream = const EventChannel("flutter_challenge/airplaneMode")
      .receiveBroadcastStream()
      .distinct();

  @override
  reset() async {
    await methodChannel.stopListeningToAirPlaneStatus();
    _controller.sink.add(null);
    subscription?.pause();
  }

  @override
  listenTo() async {
    await methodChannel.startListeningToAirPlaneStatus();
    if (_alreadyInit) {
      subscription?.resume();
    } else {
      subscription = _stream.listen(null);

      subscription?.onData((data) {
        if (data != null && data is bool) {
          _controller.sink.add(data ? AirplaneMode.on : AirplaneMode.off);
        } else {
          _controller.sink.add(AirplaneMode.desconhecido);
        }
      });
    }

    _alreadyInit = true;
  }

  @override
  Stream<AirplaneMode?> getStream() {
    return _controller.stream;
  }
}

enum AirplaneMode { on, off, desconhecido }
