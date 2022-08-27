import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:mobx/mobx.dart';

part 'airplane_controller.g.dart';

class AirplaneController = _AirplaneController with _$AirplaneController;

abstract class _AirplaneController with Store {

  final BaseStream _airplaneStreamHandler;

  @observable
  bool airplaneAuth = false;

  _AirplaneController(this._airplaneStreamHandler);

  @action
  changeStatus(bool value){
    airplaneAuth = value;

    if(airplaneAuth){
      _airplaneStreamHandler.listenTo();
    }
    else{
      _airplaneStreamHandler.reset();
    }
  }
}