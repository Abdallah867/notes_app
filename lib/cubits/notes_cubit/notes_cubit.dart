import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:meta/meta.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;

  void getNotes() {
    Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesRetrievedSuccesfully());
  }

  void trigger() {
    emit(NotesRetrievedSuccesfully());
  }
}
