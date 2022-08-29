import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_stream_channel.dart';
import 'package:mobx/mobx.dart';

part 'connection_controller.g.dart';

class ConnectionController = _ConnectionController with _$ConnectionController;

abstract class _ConnectionController with Store {
  final BaseStream<Connection?> _connectivityStreamHandler;

  _ConnectionController(this._connectivityStreamHandler);

  @observable
  bool connectionAuth = false;

  @action
  changeStatus(bool value) {
    connectionAuth = value;

    if (connectionAuth) {
      _connectivityStreamHandler.listenTo();
    } else {
      _connectivityStreamHandler.reset();
    }
  }
}
