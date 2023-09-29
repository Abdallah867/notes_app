part of 'notes_cubit.dart';

class NotesState {}

class NotesInitial extends NotesState {}

class NotesRetrievedSuccesfully extends NotesState {}

class NotesFailure extends NotesState {
  final String eMessage;
  NotesFailure(this.eMessage);
}
