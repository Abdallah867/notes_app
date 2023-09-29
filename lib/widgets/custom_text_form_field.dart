import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormField extends StatelessWidget {
  final double height;
  final double width;
  final int maxLines;
  final String hintText;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? initialValue;

  const CustomTextFormField({
    super.key,
    this.maxLines = 1,
    required this.hintText,
    this.height = 20.0,
    this.width = 12.0,
    this.onSaved,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Please enter some text";
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      onSaved: onSaved,
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
