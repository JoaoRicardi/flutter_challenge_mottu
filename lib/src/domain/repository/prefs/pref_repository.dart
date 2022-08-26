import 'package:flutter_challenge/src/data/model/user/pref.dart';

abstract class IPrefRepository {
  List<UserPref>? getUserPref();
  List<UserPref>? addPref(UserPref pref);
}