import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/local_storage/local_storage.dart';
import 'package:flutter_challenge/src/data/model/user/pref.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';


class LocalStorageImp implements ILocalStorage {


  @override
  init()async  {
    try{

      await Hive.initFlutter();
      Hive.registerAdapter(UserPrefAdapter());
      await Hive.openBox<UserPref>("user_pref");

    }catch(err){
      debugPrint("LocalStorageImp:init err:$err");
    }
  }

  @override
  List<T>? storeItem<T>(String dbName, T item) {
    try{

      var box = Hive.box<T>(dbName);
      box.add(item);

      return box.values.toList();

    }catch(err){
      debugPrint("LocalStorageImp:storeItem err:$err");
      return null;
    }
  }

  @override
  List<T>? getItem<T>(String dbName, String key)  {
    try{

      return Hive.box<T>(dbName).values.toList();
    }catch(err){

      debugPrint("LocalStorageImp:storeItem err:$err");
      return null;
    }
  }

  Future<String> getPath() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    return (await Directory(appDocDirectory.path+'/'+'dir').create(recursive: true)).path;
  }

}