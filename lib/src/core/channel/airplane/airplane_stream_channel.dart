
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_method_channel.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';

class AirPlaneStreamChannel implements BaseStream<AirplaneMode?>{

  final IAirPlaneMethodChannel methodChannel;

  static const String instanceName = 'airplane_stream';

  AirPlaneStreamChannel(this.methodChannel);


  @override
  StreamController<AirplaneMode?> controller = StreamController();

  @override
  StreamSubscription? subscription;

  bool _alreadyInit = false;

  @override
  Stream stream = const EventChannel("flutter_challenge/airplaneMode")
      .receiveBroadcastStream()
      .distinct();


  @override
  reset() async {
    await methodChannel.stopListeningToAirPlaneStatus();
    controller.sink.add(null);
    subscription?.pause();
  }

  @override
  listenTo() async {
    await methodChannel.startListeningToAirPlaneStatus();
    if(_alreadyInit){
      subscription?.resume();
    }
    else{
      subscription = stream.listen(null);

      subscription?.onData((data) {
        if(data != null && data is bool){
          controller.sink.add(data ? AirplaneMode.ON : AirplaneMode.OFF);
        }
        else{
          controller.sink.add(AirplaneMode.DESCONHECIDO);
        }
      });

    }

    _alreadyInit = true;
  }

}

enum AirplaneMode{
  ON,
  OFF,
  DESCONHECIDO
}