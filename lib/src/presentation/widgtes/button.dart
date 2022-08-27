
import 'package:flutter/material.dart';

class MottuButton extends StatelessWidget {

  final String label;
  final Function()? onTap;
  final bool isOnBottomNav;

  const MottuButton({
    Key? key,
    required this.label,
    this.onTap,
    this.isOnBottomNav = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paddingBottom =  MediaQuery.of(context).viewPadding.bottom;
    return Padding(
      padding: isOnBottomNav ? EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: paddingBottom != 0.0 ? paddingBottom : 20
      ): EdgeInsets.zero,
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color(0xFF222222))
          ),
          child: Text(label,style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),)
      ),
    );
  }
}
