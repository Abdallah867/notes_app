import 'package:flutter/material.dart';

import '../constants.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: space),
      child: IconButton(
        onPressed: () {},
        icon: Container(
          decoration: BoxDecoration(
            color: Colors.grey[800]!.withOpacity(0.6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
