import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edit_note_body.dart';

import '../constants.dart';
import '../widgets/custom_icon.dart';

class EditNoteView extends StatefulWidget {
  final NoteModel note;

  const EditNoteView({
    super.key,
    required this.note,
  });

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;
  int? color;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNoteCubit(),
      child: BlocListener<EditNoteCubit, EditNoteState>(
        listener: (context, state) {
          title = BlocProvider.of<EditNoteCubit>(context).title;
          content = BlocProvider.of<EditNoteCubit>(context).content;
          color = BlocProvider.of<EditNoteCubit>(context).color;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(left: space),
              child: Text("Edit Note"),
            ),
            actions: [
              CustomIcon(
                onPressed: () {
                  editNote(context);
                },
                icon: Icons.check,
              ),
            ],
          ),
          body: EditNoteBody(note: widget.note),
        ),
      ),
    );
  }

  void editNote(BuildContext context) {
    widget.note.title = title ?? widget.note.title;
    widget.note.content = content ?? widget.note.content;
    widget.note.color = color ?? widget.note.color;
    widget.note.save();
    BlocProvider.of<NotesCubit>(context).getNotes();
    Navigator.of(context).pop();
  }
}
