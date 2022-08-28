import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/src/core/channel/base/base_method.dart';

abstract class IAirPlaneMethodChannel implements BaseMethodChannel {
  Future<bool?> startListeningToAirPlaneStatus();
  Future<bool?> stopListeningToAirPlaneStatus();
}

class AirPlaneMethodChannel implements IAirPlaneMethodChannel {

  ///method channel para chamar o codigo nativo
  @override
  MethodChannel channel = const MethodChannel('flutter_challenge/airplane_mottu');

  ///metodos disponiveis e implementados
  final String _start = 'start';
  final String _stop = 'stop';

  @override
  Future<bool?> startListeningToAirPlaneStatus() async {
    try{
      return await channel.invokeMethod(_start) as bool;
    }catch(err){
      debugPrint(err.toString());

      return null;
    }
  }

  @override
  Future<bool?> stopListeningToAirPlaneStatus() async {
    try{
      return await channel.invokeMethod(_stop)as bool;
    }catch(err){
      debugPrint(err.toString());
      return null;
    }
  }


}

