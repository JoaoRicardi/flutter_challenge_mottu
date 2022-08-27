import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';

extension AirPlaneModeConfig on AirplaneMode{

  Widget getIcon() {
    switch (this) {
      case AirplaneMode.ON:
        return const Icon(Icons.airplanemode_active, color: Colors.white,);
      case AirplaneMode.OFF:
        return const Icon(Icons.airplanemode_inactive_outlined, color: Colors.black,);
      case AirplaneMode.DESCONHECIDO:
        return const Icon(Icons.warning, color: Colors.black,);
      default:
        return const Icon(Icons.cancel);
    }
  }

  Color getColor() {
    switch (this) {
      case AirplaneMode.ON:
        return Colors.orange;
      case AirplaneMode.OFF:
        return Colors.grey;
      case AirplaneMode.DESCONHECIDO:
        return Colors.yellow;
      default:
        return Colors.red;
    }
  }
}