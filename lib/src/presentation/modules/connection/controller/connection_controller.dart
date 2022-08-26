import 'package:flutter_challenge/src/domain/repository/prefs/pref_repository.dart';
import 'package:mobx/mobx.dart';

part 'connection_controller.g.dart';

class ConnectionController = _ConnectionController with _$ConnectionController;

abstract class _ConnectionController with Store {

  final IPrefRepository _prefRepository;

  _ConnectionController(this._prefRepository);

  @observable
  bool connectionAuth = false;


  @action
  setAuth(bool value){
    connectionAuth = value;
  }

  @action
  savePref(){
    //save pref
  }

}