import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';

extension AirPlaneModeConfig on AirplaneMode {
  Widget getIcon() {
    switch (this) {
      case AirplaneMode.on:
        return const Icon(
          Icons.airplanemode_active,
          color: Colors.white,
        );
      case AirplaneMode.off:
        return const Icon(
          Icons.airplanemode_inactive_outlined,
          color: Colors.black,
        );
      case AirplaneMode.desconhecido:
        return const Icon(
          Icons.warning,
          color: Colors.black,
        );
      default:
        return const Icon(Icons.cancel);
    }
  }

  Color getColor() {
    switch (this) {
      case AirplaneMode.on:
        return Colors.orange;
      case AirplaneMode.off:
        return Colors.grey;
      case AirplaneMode.desconhecido:
        return Colors.yellow;
      default:
        return Colors.red;
    }
  }
}
