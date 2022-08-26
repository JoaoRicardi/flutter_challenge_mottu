import 'package:mobx/mobx.dart';

part 'airplane_controller.g.dart';

class AirplaneController = _AirplaneController with _$AirplaneController;

abstract class _AirplaneController with Store {

  @observable
  bool airplaneAuth = false;

  @action
  setAuth(bool value){
    airplaneAuth = value;
  }

  @action
  savePref(){
    //save pref
  }

}