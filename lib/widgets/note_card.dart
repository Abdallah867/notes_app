import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/custom_text.dart';

class NoteCard extends StatelessWidget {
  final NoteModel? note;
  const NoteCard({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EditNoteView(note: note!)),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(note!.color),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 200.0,
                          ),
                          child: CustomText(
                            text: note!.title,
                            fontSize: 22.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: IconButton(
                            onPressed: () {
                              note?.delete();
                              BlocProvider.of<NotesCubit>(context).getNotes();
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 200,
                      ),
                      child: CustomText(
                        text: note!.content,
                        fontSize: 16.0,
                        color: const Color.fromARGB(255, 110, 110, 110),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          text: note!.date,
                          color: const Color.fromARGB(255, 110, 110, 110),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
