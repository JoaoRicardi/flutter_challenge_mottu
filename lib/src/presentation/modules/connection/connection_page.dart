import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/widget.dart';
import 'package:flutter_challenge/src/core/di/di_handler_imp.dart';
import 'package:flutter_challenge/src/presentation/modules/airplane/airplane_page.dart';
import 'package:flutter_challenge/src/presentation/modules/connection/controller/connection_controller.dart';
import 'package:flutter_challenge/src/presentation/widgtes/asset_handler.dart';
import 'package:flutter_challenge/src/presentation/widgtes/button.dart';
import 'package:flutter_challenge/src/presentation/widgtes/configuration_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ConnectionPage extends StatelessWidget with BaseWidgetStateless{

  static const int position = 1;

  final PageController pageController;

  ConnectionPage({
    Key? key,
    required this.pageController
  }) : super(key: key);

  get controller => get<ConnectionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20
        ),
        child: Column(
          children: [
            MottuAssetHandler(
              assset: constants.assets.signal,
              height: MediaQuery.of(context).size.width,
            ),
            const Text(
              'Permitir que o app acessa dados de conexão ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 24,),
            const Text(
              'Caso habilitado, caso o tipo de conexão seja alterado iremos exibir pra você.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
            ),
            const Spacer(),
            Observer(
                builder: (context) {
                  return ConfigurationItem(
                    label: 'Permito o compatilhamento de dados de rede',
                    value: controller.connectionAuth,
                    onChange: (value) => controller.changeStatus(value),
                  );
                }
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: MottuButton(
        label: "Próximo",
        isOnBottomNav: true,
        onTap: () async {
          pageController.jumpToPage(AirplanePage.position);
        },
      ),
    );
  }
}
