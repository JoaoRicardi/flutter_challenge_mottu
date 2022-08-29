
import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/di/di_handler.dart';
import 'package:flutter_challenge/src/core/di/di_handler_imp.dart';
import 'package:flutter_challenge/src/presentation/modules/home/controller/home_controller.dart';
import 'package:flutter_challenge/src/presentation/widgtes/configuration_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {

  static const int position = 3;

  final PageController pageController;

  const HomePage({
    Key? key,
    required this.pageController
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeController controller = DIHandlerImp().get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
                builder: (context) {
                  return ConfigurationItem(
                    label: 'Permito o compatilhamento de dados de rede',
                    currentValue: controller.isConnectionEnable,
                    onChange: (value) => controller.changeConnectivityStatus(value),
                  );
                }
            ),
            Observer(
                builder: (context) {
                  return ConfigurationItem(
                    label: 'Permito o compatilhamento sobre o modo do celular.',
                    currentValue: controller.isAirplaneEnable,
                    onChange: (value) => controller.changeAirPlaneStatus(value),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
//
// abstract class BasePage<T extends Object> {
//    late T controller;
// }
//
// class BaseWidget<T extends Object> implements BasePage<T> {
//   IDIHandler inject = DIHandlerImp();
//
//   @override
//   late T controller;
// }



