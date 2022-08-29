import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/base_widget.dart';
import 'package:flutter_challenge/src/presentation/modules/airplane/airplane_page.dart';
import 'package:flutter_challenge/src/presentation/modules/connection/connection_page.dart';
import 'package:flutter_challenge/src/presentation/modules/home/home_page.dart';
import 'package:flutter_challenge/src/presentation/modules/main/controller/main_controller.dart';
import 'package:flutter_challenge/src/presentation/modules/welcome/welcome_page.dart';
import 'package:flutter_challenge/src/presentation/widgtes/airplane/airplane_mode_floating.dart';
import 'package:flutter_challenge/src/presentation/widgtes/connection/connection_app_bar.dart';

class MainPage extends StatefulWidget {
  static const String route = "/";

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with BaseWidget {
  late PageController _pageController;

  late MainController controller;

  @override
  void initState() {
    controller = inject.get()..init();
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ConnectionAppBar(
          stream: controller.connectionController.stream,
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: getPages(),
        ),
        floatingActionButton:
            AirplaneModeFloating(stream: controller.airplaneController.stream));
  }

  List<Widget> getPages() {
    return [
      WelcomePage(
        pageController: _pageController,
      ),
      ConnectionPage(pageController: _pageController),
      AirplanePage(pageController: _pageController),
      HomePage(
        pageController: _pageController,
      )
    ];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
