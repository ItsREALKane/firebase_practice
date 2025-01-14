// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_super_parameters

import 'package:flutter/material.dart';

class BtnLogin extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  final double fontSize;
  final Widget icon;

  const BtnLogin({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
    required this.fontSize,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon ?? SizedBox(),
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: bgColor,
        side: BorderSide(color: borderColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      label: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
