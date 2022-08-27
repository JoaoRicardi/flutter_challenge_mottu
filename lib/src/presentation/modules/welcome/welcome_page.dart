import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/widget.dart';
import 'package:flutter_challenge/src/presentation/modules/connection/connection_page.dart';
import 'package:flutter_challenge/src/presentation/widgtes/asset_handler.dart';
import 'package:flutter_challenge/src/presentation/widgtes/button.dart';

class WelcomePage extends StatelessWidget with BaseWidgetStateless {

  static const int position = 0;

  final PageController pageController;

  WelcomePage({
    Key? key,
    required this.pageController
  }) : super(key: key);

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
              assset: constants.assets.relaxing,
              height: MediaQuery.of(context).size.width,
            ),
            const Text(
                'Pensamos em novas formas de melhorar o nosso app, para que você trabalhe masi tranquilo.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 24,),
            const Text(
              'Pediremos algumas permissões para que nosso app posso dar alguns feedbacks, pensando sempre na sua segurança e de seu trabalho.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MottuButton(
        label: "Próximo",
        isOnBottomNav: true,
        onTap: (){
          pageController.jumpToPage(ConnectionPage.position);
        },
      ),
    );
  }
}

