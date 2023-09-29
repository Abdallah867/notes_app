import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());
  String? title;
  String? content;
  int? color;
  void changeTitle(String newTitle) {
    title = newTitle;
    emit(NoteEdited());
  }

  void changeContent(String newContent) {
    content = newContent;
    emit(NoteEdited());
  }

  void changeColor(int newColor) {
    color = newColor;
    emit(NoteEdited());
  }
}
