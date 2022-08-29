import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_stream_channel.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final BaseStream<Connection?> _connectivityStreamHandler;
  final BaseStream<AirplaneMode?> _airplaneStreamHandler;

  _HomeController(
    this._connectivityStreamHandler,
    this._airplaneStreamHandler,
  ) {
    isAirplaneEnable = !(_airplaneStreamHandler.subscription?.isPaused ?? true);
    isConnectionEnable =
        !(_connectivityStreamHandler.subscription?.isPaused ?? true);
  }

  @observable
  bool isAirplaneEnable = false;

  @observable
  bool isConnectionEnable = false;

  @action
  changeAirPlaneStatus(bool value) {
    isAirplaneEnable = value;
    if (isAirplaneEnable) {
      _airplaneStreamHandler.listenTo();
    } else {
      _airplaneStreamHandler.reset();
    }
  }

  @action
  changeConnectivityStatus(bool value) {
    isConnectionEnable = value;
    if (isConnectionEnable) {
      _connectivityStreamHandler.listenTo();
    } else {
      _connectivityStreamHandler.reset();
    }
  }
}
