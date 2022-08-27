import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/src/core/channel/base/base_method.dart';

abstract class IBatteryMethodChannel implements BaseMethodChannel {
  Future<int?> getBattery();
}

class BatteryMethodChannel implements IBatteryMethodChannel {

  ///method channel para chamar o codigo nativo
  @override
  MethodChannel channel = const MethodChannel('flutter_challenge/battery');

  ///metodos disponiveis e implementados
  final String _getBatteryTotal = 'getBattery';

  @override
  Future<int?> getBattery() async {
    try{
      return await channel.invokeMethod(_getBatteryTotal);
    }catch(err){
      debugPrint(err.toString());

      return null;
    }
  }


}

