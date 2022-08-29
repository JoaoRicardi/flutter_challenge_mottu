import 'package:flutter/material.dart';

class ConfigurationItem extends StatelessWidget {
  final bool currentValue;
  final String label;
  final Function(bool) onChange;

  const ConfigurationItem(
      {Key? key,
      required this.currentValue,
      required this.label,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label)),
        Switch(
            value: currentValue,
            onChanged: onChange
        )
      ],
    );
  }
}
