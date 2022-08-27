
import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';

class HomePage extends StatefulWidget {

  static const int position = 3;

  final PageController pageController;

  const HomePage({
    Key? key,
    required this.pageController
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // var clicked1 = false;
  // var clicked2 = false;
  //
  // var airplaneMethodChannel = AirPlaneMethodChannel();
  // var airplaneStreamChannel = AirPlaneStreamChannel();
  //
  // var connectivityChannel = ConnectivityStreamChannel();
  //
  // var batteryText = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ElevatedButton(
            //   onPressed: (){
            //     if(clicked1){
            //       //para desligar
            //       airplaneMethodChannel.stopListeningToAirPlaneStatus();
            //       airplaneStreamChannel.reset();
            //     }
            //     else{
            //       //todo caso seja a primeira vez
            //       airplaneMethodChannel.startListeningToAirPlaneStatus();
            //       airplaneStreamChannel.listenTo();
            //     }
            //
            //     setState(() {
            //       clicked1 = !clicked1;
            //     });
            //   },
            //   child: Text(clicked1 ? 'Desligar' : 'Test air plane mode')
            // ),
            // ElevatedButton(
            //     onPressed: (){
            //       if(clicked2){
            //         //para desligar
            //         connectivityChannel.listenTo();
            //       }
            //       else{
            //         connectivityChannel.reset();
            //       }
            //
            //       setState(() {
            //         clicked2 = !clicked2;
            //       });
            //     },
            //     child: Text(clicked1 ? 'Desligar' : 'Teste de conexão')
            // ),
            // Text(batteryText,style: const TextStyle( fontSize: 22),),
            // ElevatedButton(
            //   onPressed: () async {
            //     var batteryMethod = BatteryMethodChannel();
            //
            //     var res = await batteryMethod.getBattery();
            //
            //
            //     setState(() {
            //       batteryText = "$res funciona";
            //     });
            //   },
            //   child: const Text("Pegar valor da service")
            // )
          ],
        ),
      ),
      // floatingActionButton: StreamBuilder(
      //     stream: airplaneStreamChannel.controller?.stream,
      //     builder: (context, snapshot) {
      //       if(snapshot.data != null && snapshot.data is AirplaneMode){
      //         return FloatingActionButton(
      //           backgroundColor: getColor(snapshot.data as AirplaneMode),
      //           onPressed: () {
      //           },
      //           child: getIcon(snapshot.data as AirplaneMode),
      //         );
      //       }
      //       return const SizedBox();
      //     }),
    );
  }

  Widget getIcon(AirplaneMode? mode) {
    switch (mode) {
      case AirplaneMode.ON:
        return const Icon(Icons.airplanemode_active);
      case AirplaneMode.OFF:
        return const Icon(Icons.airplanemode_inactive_outlined);
      case AirplaneMode.DESCONHECIDO:
        return const Icon(Icons.warning);
      default:
        return const Icon(Icons.cancel);
    }
  }

  Color getColor(AirplaneMode? mode) {
    switch (mode) {
      case AirplaneMode.ON:
        return Colors.orange;
      case AirplaneMode.OFF:
        return Colors.green;
      case AirplaneMode.DESCONHECIDO:
        return Colors.grey;
      default:
        return Colors.red;
    }
  }
}



