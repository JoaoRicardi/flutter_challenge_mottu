import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/widget.dart';
import 'package:flutter_challenge/src/presentation/modules/connection/connection_page.dart';
import 'package:flutter_challenge/src/presentation/widgtes/asset_handler.dart';

class WelcomePage extends StatelessWidget with BaseWidgetStateless {

  static const String route = '/welcome';

  WelcomePage({Key? key}) : super(key: key);

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
          navigationHandler.push(ConnectionPage.route);
        },
      ),
    );
  }
}

class MottuButton extends StatelessWidget {

  final String label;
  final Function()? onTap;
  final bool isOnBottomNav;

  const MottuButton({
    Key? key,
    required this.label,
    this.onTap,
    this.isOnBottomNav = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paddingBottom =  MediaQuery.of(context).viewPadding.bottom;
    return Padding(
      padding: isOnBottomNav ? EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: paddingBottom != 0.0 ? paddingBottom : 20
      ): EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFF222222))
        ),
        child: Text(label,style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500
        ),)
      ),
    );
  }
}

