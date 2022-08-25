import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/widget.dart';
import 'package:flutter_challenge/src/presentation/modules/airplane/airplane_page.dart';
import 'package:flutter_challenge/src/presentation/modules/welcome/welcome_page.dart';
import 'package:flutter_challenge/src/presentation/widgtes/asset_handler.dart';

class ConnectionPage extends StatelessWidget with BaseWidgetStateless{

  static const String route = '/connection';

  ConnectionPage({Key? key}) : super(key: key);

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
              assset: constants.assets.airplane,
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
              'Se o seu celular atualmente esta conecta a uma rede wifi/4g ou sem sinal.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Expanded(child: Text('Permito o compatilhamento de dados de rede')),
                Switch(value: true, onChanged: (value){})
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: MottuButton(
        label: "Próximo",
        isOnBottomNav: true,
        onTap: (){
          navigationHandler.push(AirplanePage.route);
        },
      ),
    );
  }
}
