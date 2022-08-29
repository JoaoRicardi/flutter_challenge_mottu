import 'dart:async';

import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_stream_channel.dart';
import 'package:mobx/mobx.dart';

part 'main_controller.g.dart';

class MainController = _MainController with _$MainController;

abstract class _MainController with Store {

  final BaseStream<Connection?> _connectivityStreamHandler;
  final BaseStream<AirplaneMode?> _airplaneModeStreamHandler;

  _MainController(this._connectivityStreamHandler, this._airplaneModeStreamHandler){

    _airplaneModeStreamHandler.controller.stream.listen((event) {
      airplaneController.sink.add(event);
    });

    _connectivityStreamHandler.controller.stream.listen((event) {
      connectionController.sink.add(event);
    });
  }

  StreamController<AirplaneMode?> airplaneController = StreamController();
  StreamController<Connection?> connectionController = StreamController();


}