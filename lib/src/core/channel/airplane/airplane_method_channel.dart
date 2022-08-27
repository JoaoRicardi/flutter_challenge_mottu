import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/src/core/channel/base/base_method.dart';

abstract class IAirPlaneMethodChannel implements BaseMethodChannel {
  Future startListeningToAirPlaneStatus();
  Future stopListeningToAirPlaneStatus();
}

class AirPlaneMethodChannel implements IAirPlaneMethodChannel {

  ///method channel para chamar o codigo nativo
  @override
  MethodChannel channel = const MethodChannel('flutter_challenge/airplane_mottu');

  ///metodos disponiveis e implementados
  final String _start = 'start';
  final String _stop = 'stop';

  @override
  Future startListeningToAirPlaneStatus() async {
    try{
      var res = await channel.invokeMethod(_start);
      return res;
    }catch(err){
      debugPrint(err.toString());
    }
  }

  @override
  Future stopListeningToAirPlaneStatus() async {
    try{
      return await channel.invokeMethod(_stop);
    }catch(err){
      debugPrint(err.toString());
    }
  }


}

