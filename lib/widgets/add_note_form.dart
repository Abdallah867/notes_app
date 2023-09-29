import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  String? title, content;
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomTextFormField(
            hintText: "Title",
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            hintText: "Content",
            maxLines: 5,
            onSaved: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ColorsListView(),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  text: "Add",
                  onPressed: () {
                    validateInformations(context);
                  });
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void validateInformations(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      BlocProvider.of<AddNoteCubit>(context).addNote(
        NoteModel(
          title: title!,
          content: content!,
          color: BlocProvider.of<AddNoteCubit>(context).choosenColor,
          date: DateFormat.yMMMMd().format(now),
        ),
      );
    } else {
      autoValidate = AutovalidateMode.always;
    }
  }
}
