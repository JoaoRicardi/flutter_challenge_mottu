import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/base_widget.dart';
import 'package:flutter_challenge/src/core/navigation/navigation_handler.dart';
import 'package:flutter_challenge/src/presentation/modules/main/main_page.dart';

class MyApp extends StatelessWidget with BaseWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navigationHandler = inject.get<INavigationHandler>();
    return MaterialApp(
      title: 'Flutter Demo For Challenge',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigationHandler.appGlobalKey,
      onGenerateRoute: navigationHandler.appRoutes,
      initialRoute: MainPage.route,
    );
  }
}
