import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/app.dart';
import 'package:flutter_challenge/src/core/di/di_handler_imp.dart';

 main() async {

  DIHandlerImp()
    .init();

  runApp(MyApp());
}

