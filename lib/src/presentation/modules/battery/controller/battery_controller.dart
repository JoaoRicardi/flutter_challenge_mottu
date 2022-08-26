import 'package:mobx/mobx.dart';

part 'battery_controller.g.dart';

class BatteryController = _BatteryController with _$BatteryController;

abstract class _BatteryController with Store {

  @observable
  bool batteryAuth = false;

  @action
  setAuth(bool value){
    batteryAuth = value;
  }

  @action
  savePref(){
    //save pref
  }

}