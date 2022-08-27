import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/app.dart';
import 'package:flutter_challenge/src/core/di/di_handler_imp.dart';

 main() async {

  var inject = DIHandlerImp();

  inject.init();

  // inject.get<ILocalStorage>().init();

  runApp(MyApp());
}

