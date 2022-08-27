

import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
import 'package:flutter_challenge/src/core/extensions/airplane_mode.dart';

class AirplaneModeFloating extends StatelessWidget {

  final AirplaneMode mode;

  const AirplaneModeFloating({
    Key? key,
    required this.mode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: mode.getColor(),
      onPressed: () {
      },
      child: mode.getIcon(),
    );
  }
}