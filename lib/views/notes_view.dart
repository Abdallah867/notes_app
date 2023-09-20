import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/custom_icon.dart';
import '../widgets/notes_list_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => const AddNoteBottomSheet(),
          );
        },
        backgroundColor: kAddNoteColor,
        child: const Icon(
          Icons.add,
          size: 24,
          color: Colors.black,
        ),
      ),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: space),
          child: Text("Notes"),
        ),
        actions: const [
          CustomIcon(
            icon: Icons.search,
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: space,
        ),
        child: NotesListView(),
      ),
    );
  }
}
