import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';
import 'package:notes_app/widgets/edit_color_list_view.dart';

class EditNoteBody extends StatelessWidget {
  final NoteModel note;

  const EditNoteBody({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: space,
        vertical: 12.0,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            onChanged: (value) {
              BlocProvider.of<EditNoteCubit>(context).changeTitle(value ?? "");
            },
            initialValue: note.title,
            hintText: "Title",
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            onChanged: (value) {
              BlocProvider.of<EditNoteCubit>(context)
                  .changeContent(value ?? "");
            },
            initialValue: note.content,
            hintText: "Content",
            maxLines: 5,
          ),
          const SizedBox(
            height: 30.0,
          ),
          EditColorsListView(
            color: note.color,
          ),
        ],
      ),
    );
  }
}
