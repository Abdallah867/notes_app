import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_card.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({
    super.key,
  });

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesRetrievedSuccesfully) {
          final List<NoteModel> notesList =
              BlocProvider.of<NotesCubit>(context).notes!;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: BlocBuilder<NotesCubit, NotesState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (context, index) => NoteCard(
                    note: notesList[index],
                  ),
                );
              },
            ),
          );
        } else {
          return Text("");
        }
      },
    );
  }
}
