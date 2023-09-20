import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_search_icon.dart';
import '../widgets/note_card.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: space),
          child: Text("Notes"),
        ),
        actions: const [
          CustomSearchIcon(),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: space,
        ),
        child: Column(
          children: [
            NoteCard(),
          ],
        ),
      ),
    );
  }
}
