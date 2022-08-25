import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MottuAssetHandler extends StatelessWidget {

  final String assset;
  final double? width;
  final double? height;

  const MottuAssetHandler(
      {Key? key, required this.assset, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assset,
      height: height,
      width: width,
    );
  }
}
