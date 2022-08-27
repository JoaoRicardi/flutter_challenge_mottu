import 'dart:async';

import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:mobx/mobx.dart';

part 'main_controller.g.dart';

class MainController = _MainController with _$MainController;

abstract class _MainController with Store {

  final BaseStream connectivityStreamHandler;
  final BaseStream airplaneModeStreamHandler;

  _MainController(this.connectivityStreamHandler, this.airplaneModeStreamHandler);


  // @observable
  // StreamController? connectivityStreamController;// => _connectivityStreamHandler.controller;
  //
  // @observable
  // StreamController? airplaneModeStreamController;// => _airplaneModeStreamHandler.controller;


}