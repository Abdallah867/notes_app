import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  final bool isSelected;
  final Color? color;

  const ColorItem({
    super.key,
    required this.isSelected,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: isSelected ? 20.0 : 16.0,
      backgroundColor: color,
    );
  }
}
