import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes_app/widgets/color_item.dart';

class EditColorsListView extends StatefulWidget {
  int color;
  late int choosenColorIndex;

  EditColorsListView({
    super.key,
    required this.color,
  });

  @override
  State<EditColorsListView> createState() => _EditColorsListViewState();
}

class _EditColorsListViewState extends State<EditColorsListView> {
  @override
  void initState() {
    widget.choosenColorIndex = comingColor(widget.color);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.choosenColorIndex = index;
              });
              BlocProvider.of<EditNoteCubit>(context)
                  .changeColor(colors[widget.choosenColorIndex]);
            },
            child: ColorItem(
              isSelected: widget.choosenColorIndex == index,
              color: Color(colors[index]),
            ),
          ),
        ),
      ),
    );
  }
}

int comingColor(int oldColor) {
  for (int i = 0; i < colors.length; i++) {
    if (colors[i] == oldColor) {
      return i;
    } else {
      i++;
    }
  }
  return 0;
}
