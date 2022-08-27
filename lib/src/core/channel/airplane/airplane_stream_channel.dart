
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';

class AirPlaneStreamChannel implements BaseStream{

  static const String instanceName = 'airplane_stream';

  @override
  StreamController controller = StreamController();

  @override
  Stream stream = const EventChannel("flutter_challenge/airplaneMode")
      .receiveBroadcastStream()
      .distinct();

  @override
  listenTo() {
    alreadyInit = true;
    stream.listen((event) {
      if(event != null){
        if(!(controller.isClosed)) {
          if(event is bool){
            controller.sink.add(event ? AirplaneMode.ON : AirplaneMode.OFF);
          }
          else {
            controller.sink.add(AirplaneMode.DESCONHECIDO);
          }
        }
      }
    });
  }

  @override
  reset() {
    alreadyInit = false;
    controller.sink.add(null);
    controller.sink.close();
  }

  @override
  bool alreadyInit = false;
}

enum AirplaneMode{
  ON,
  OFF,
  DESCONHECIDO
}