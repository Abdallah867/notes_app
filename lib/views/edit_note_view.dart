import 'package:flutter/material.dart';
import 'package:notes_app/widgets/edit_note_body.dart';

import '../constants.dart';
import '../widgets/custom_icon.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: space),
          child: Text("Edit Note"),
        ),
        actions: const [
          CustomIcon(
            icon: Icons.check,
          ),
        ],
      ),
      body: const EditNoteBody(),
    );
  }
}
