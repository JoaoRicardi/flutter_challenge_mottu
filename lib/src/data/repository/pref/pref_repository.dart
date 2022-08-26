import 'package:flutter_challenge/src/core/local_storage/local_storage.dart';
import 'package:flutter_challenge/src/data/model/user/pref.dart';
import 'package:flutter_challenge/src/domain/repository/prefs/pref_repository.dart';

class PrefRepositoryImp implements IPrefRepository {

  final ILocalStorage _localStorage;

  PrefRepositoryImp(this._localStorage);

  static const String tableName = "userPref";
  static const String key = "user_preferences_key";

  @override
  List<UserPref>? addPref(UserPref pref) {
    try{
      return _localStorage.storeItem<UserPref>(tableName, pref);
    }catch(err){
      return [];
    }
  }

  @override
  List<UserPref>? getUserPref() {
    try{
      return _localStorage.getItem<UserPref>(tableName, key);
    }catch(err){
      return [];
    }
  }

}