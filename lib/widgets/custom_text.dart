import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const CustomText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: "Poppins",
      ),
    );
  }
}
