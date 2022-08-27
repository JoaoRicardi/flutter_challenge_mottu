import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/widget.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_channel.dart';
import 'package:flutter_challenge/src/core/extensions/connection.dart';
import 'package:flutter_challenge/src/presentation/modules/main/controller/main_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
class ConnectionAppBar extends StatelessWidget
    with BaseWidgetStateless
    implements PreferredSizeWidget {
  ConnectionAppBar({Key? key, required this.controller}) : super(key: key);

  final MainController? controller;

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
        stream: controller?.connectivityStreamHandler.controller.stream,
        builder: (context, snapshot) {
          var connection = snapshot.data;
          if(connection != null && connection is Connection){
            return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
              child: Container(
                width: double.infinity,
                height: 40,
                color: connection.getConnectionColor(),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        connection.getFormattedName(),
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Icon(connection.getIcon(),color: Colors.white,)
                    ],
                  ),
                ),
              ),
            );
          }
          else{
            return const SizedBox();
          }
        }
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);

}
