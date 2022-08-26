import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/widget.dart';
import 'package:flutter_challenge/src/presentation/modules/battery/controller/battery_controller.dart';
import 'package:flutter_challenge/src/presentation/modules/home/home_page.dart';
import 'package:flutter_challenge/src/presentation/modules/welcome/welcome_page.dart';
import 'package:flutter_challenge/src/presentation/widgtes/asset_handler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BatteryPage extends StatelessWidget with BaseWidgetStateless {

  static const String route = '/battery';

  BatteryPage({Key? key}) : super(key: key);

  final controller = BatteryController();

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
              assset: constants.assets.howLong,
              height: MediaQuery.of(context).size.width,
            ),
            const Text(
              'Permitir que o app acesse a informações da bateria?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 24,),
            const Text(
              'Para fazer o calculo estimado de quanto o celular dura, até a proxíma carga',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Expanded(child: Text('Permito o compatilhamento de dados da bateria.')),
                Observer(
                  builder: (context) {
                    return Switch(
                      value: controller.batteryAuth,
                      onChanged: (value) => controller.setAuth(value)
                    );
                  }
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: MottuButton(
        label: "Próximo",
        isOnBottomNav: true,
        onTap: () async {
          await controller.savePref();
          navigationHandler.pushReplacement(HomePage.route);

        },
      ),
    );
  }
}
