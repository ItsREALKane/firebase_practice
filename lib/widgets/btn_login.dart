// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class BtnLogin extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  final double fontSize;
  final Widget? Icon;
  final VoidCallback onPressed;

  const BtnLogin({
    Key? key,
    required this.text,
    required this.onPressed, required this.bgColor, required this.borderColor, required this.textColor, required this.fontSize, this.Icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(
        color: textColor,
        fontSize: fontSize,
      ),),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: borderColor,
            width: 2,
          ),
        ),
      ),
      
    );
  }
}
