import 'dart:async';

import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_stream_channel.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

part 'main_controller.g.dart';

class MainController = _MainController with _$MainController;

abstract class _MainController with Store {
  final BaseStream<Connection?> _connectivityStreamHandler;
  final BaseStream<AirplaneMode?> _airplaneModeStreamHandler;

  _MainController(
      this._connectivityStreamHandler, this._airplaneModeStreamHandler);

  StreamController<AirplaneMode?> airplaneController = BehaviorSubject();
  StreamController<Connection?> connectionController = BehaviorSubject();

  @action
  init() {
    _airplaneModeStreamHandler.getStream().listen((event) {
      airplaneController.sink.add(event);
    });

    _connectivityStreamHandler.getStream().listen((event) {
      connectionController.sink.add(event);
    });
  }

  @action
  dispose() {
    airplaneController.close();
    connectionController.close();
  }
}
