import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
import 'package:flutter_challenge/src/core/extensions/airplane_mode.dart';

class AirplaneModeFloating extends StatelessWidget {
  final Stream stream;

  const AirplaneModeFloating({Key? key, required this.stream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.data is AirplaneMode) {
            var mode = snapshot.data as AirplaneMode;
            return FloatingActionButton(
              key: const Key('airplane_mode_with_value'),
              backgroundColor: mode.getColor(),
              onPressed: () {},
              child: mode.getIcon(),
            );
          }

          return const SizedBox(
            key: Key('airplane_mode_empty'),
          );
        });
  }
}
