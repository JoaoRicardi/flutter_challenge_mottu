import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/widget.dart';
import 'package:flutter_challenge/src/presentation/modules/home/home_page.dart';

class MyApp extends StatelessWidget with BaseWidgetStateless{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo For Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigationHandler.appGlobalKey,
      onGenerateRoute: navigationHandler.appRoutes,
      initialRoute: HomePage.route,
    );
  }
}