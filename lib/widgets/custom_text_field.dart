import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextInput extends StatelessWidget {
  final double height;
  final double width;
  final int maxLines;
  final String hintText;

  const CustomTextInput({
    super.key,
    this.maxLines = 1,
    required this.hintText,
    this.height = 20.0,
    this.width = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      cursorColor: kAddNoteColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: height,
          horizontal: width,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: kAddNoteColor,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kAddNoteColor,
          ),
        ),
      ),
    );
  }
}
