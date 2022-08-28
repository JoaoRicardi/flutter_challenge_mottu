
import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/widget.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
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

class _HomePageState extends State<HomePage> with BaseWidgetStateful{

  get controller => get<HomeController>();

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
                    value: controller.isConnectionEnable,
                    onChange: (value) => controller.changeConnectivityStatus(value),
                  );
                }
            ),
            Observer(
                builder: (context) {
                  return ConfigurationItem(
                    label: 'Permito o compatilhamento sobre o modo do celular.',
                    value: controller.isAirplaneEnable,
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



