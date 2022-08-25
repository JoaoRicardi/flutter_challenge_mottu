import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/widget.dart';
import 'package:flutter_challenge/src/presentation/modules/welcome/welcome_page.dart';

class MyApp extends StatelessWidget with BaseWidgetStateless{

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo For Challenge',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigationHandler.appGlobalKey,
      onGenerateRoute: navigationHandler.appRoutes,
      initialRoute: WelcomePage.route,
    );
  }
}