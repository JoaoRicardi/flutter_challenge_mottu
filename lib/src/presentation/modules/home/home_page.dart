import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/base/widget.dart';
import 'package:flutter_challenge/src/core/channel/connectivity_channel.dart';
import 'package:flutter_challenge/src/core/di/di_handler.dart';
import 'package:flutter_challenge/src/core/di/di_handler_imp.dart';

class HomePage extends StatefulWidget {

  static const String route = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  final IDIHandler _di = DIHandlerImp();

  var available = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MottuAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Permitir que o app exiba o status da sua conexão ?'),
            Switch(
              value: available,
              onChanged: (bool value){
                var connetionHandler = _di.get<ConnectivityEventChannel>();

                if(value){
                  connetionHandler.listenTo();
                }
                else{
                  connetionHandler.reset();
                }

                setState(() {
                  available = value;
                });
              }
            )
          ],
        ),
      ),
    );
  }
}



class MottuAppBar extends StatelessWidget with BaseWidgetStateless  implements PreferredSizeWidget {

  MottuAppBar({Key? key}) : super(key: key);

  get connectionHandler => get<ConnectivityEventChannel>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          StreamBuilder<Connection?>(
              stream: connectionHandler.controller?.stream,
              builder: (context, snapshot) {
                return Visibility(
                  visible: snapshot.data != null ||  snapshot.data != Connection.notListening,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      color: getConnectionColor(snapshot.data),
                      child: Center(
                        child: Text(
                          snapshot.data?.name.toString() ?? "",
                        ),
                      ),
                    ),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);


  Color getConnectionColor(Connection?  connection){
    switch(connection){
      case Connection.wifi:
        return Colors.yellow;
      case Connection.cellular:
        return Colors.blueAccent;
      case Connection.disconnected:
        return Colors.red;
      case Connection.unknown:
        return Colors.pink;
      case Connection.notListening:
        return Colors.transparent;
      default:
        return Colors.transparent;
    }


  }
}
