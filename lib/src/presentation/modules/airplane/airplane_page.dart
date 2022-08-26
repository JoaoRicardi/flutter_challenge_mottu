import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/widget.dart';
import 'package:flutter_challenge/src/presentation/modules/airplane/controller/airplane_controller.dart';
import 'package:flutter_challenge/src/presentation/modules/battery/battery_page.dart';
import 'package:flutter_challenge/src/presentation/modules/welcome/welcome_page.dart';
import 'package:flutter_challenge/src/presentation/widgtes/asset_handler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AirplanePage extends StatelessWidget with BaseWidgetStateless {

  static const String route = '/airplane';

  AirplanePage({Key? key}) : super(key: key);

  final controller = AirplaneController();

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
              'Permitir que o app acesse a informação de modo avião?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 24,),
            const Text(
              'Caso o seu celular esteja em modo avião.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Expanded(child: Text('Permito o compatilhamento sobre o modo do celular.')),
                Observer(
                  builder: (context) {
                    return Switch(
                        value: controller.airplaneAuth,
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
          navigationHandler.push(BatteryPage.route);
        },
      ),
    );
  }
}
