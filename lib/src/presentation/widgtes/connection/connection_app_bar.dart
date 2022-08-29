import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/base_widget.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_stream_channel.dart';
import 'package:flutter_challenge/src/core/extensions/connection.dart';

class ConnectionAppBar extends StatelessWidget
    with BaseWidget
    implements PreferredSizeWidget {
  ConnectionAppBar({Key? key, required this.stream}) : super(key: key);

  final Stream? stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          var connection = snapshot.data;
          if (connection != null && connection is Connection) {
            return Padding(
              key: const Key('connection_with_value'),
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
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
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Icon(
                        connection.getIcon(),
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox(
              key: Key('connection_empty'),
            );
          }
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
