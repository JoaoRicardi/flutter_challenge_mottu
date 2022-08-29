import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/widget.dart';
import 'package:flutter_challenge/src/core/di/di_handler_imp.dart';
import 'package:flutter_challenge/src/presentation/modules/airplane/controller/airplane_controller.dart';
import 'package:flutter_challenge/src/presentation/modules/home/home_page.dart';
import 'package:flutter_challenge/src/presentation/widgtes/asset_handler.dart';
import 'package:flutter_challenge/src/presentation/widgtes/button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AirplanePage extends StatelessWidget with BaseWidgetStateless {

  static const int position = 2;

  final PageController pageController;

  AirplanePage({
    Key? key,
    required this.pageController
  }) : super(key: key);

  AirplaneController controller = DIHandlerImp().get<AirplaneController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MottuAssetHandler(
                assset: constants.assets.airplane,
                height: MediaQuery.of(context).size.width,
              ),
              const Text(
                'Permitir que o app acesse a informação de modo avião?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 24,),
              const Text(
                'Caso habilitado, ao trocar o status do modo avião iremos exibir pra você.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),
              ),
              const SizedBox(height: 32,),
              Observer(
                  builder: (context) {
                    return  Row(
                      children: [
                        const Expanded(child: Text('Permito o compatilhamento sobre o modo do celular.')),
                        Switch(
                          key: const Key('airplane_auth_switch'),
                            value: controller.airplaneAuth,
                            onChanged: (value) => controller.changeStatus(value)
                        )
                      ],
                    );
                  }
              ),
              const SizedBox(height: 32,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MottuButton(
        label: "Próximo",
        isOnBottomNav: true,
        onTap: () async {
          pageController.jumpToPage(HomePage.position);
        },
      ),
    );
  }
}
