import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:noteapp/modle/note_modle.dart';
import 'package:noteapp/view/wedget/custom_text_field.dart';

import 'custom_buttom_text_field.dart';

class Note_Buttom_Form_sheet extends StatefulWidget {
  const Note_Buttom_Form_sheet({
    super.key,
  });

  @override
  State<Note_Buttom_Form_sheet> createState() => _Note_Buttom_Form_sheetState();
}

class _Note_Buttom_Form_sheetState extends State<Note_Buttom_Form_sheet> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode
      .onUserInteraction; //هو خاصية في Form (أو TextFormField) تتحكم في موعد تنفيذ الـ validation.

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(children: [
                CustomTextField(
                    onSaved: (value) {
                      title = value;
                    },
                    hint: "Title"),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onSaved: (value) {
                    subTitle = value;
                  },
                  hint: "Content",
                  maxlines: 5,
                )
              ]),
              SizedBox(
                height: 32,
              ),
              BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) {
                  return CustomButtom(
                    isloading: State is AddNoteLoading ? true : false,
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        //اذا كانت الحالة الحالية للنموذج صحيحة
                        formkey.currentState!.save();

                        //احفظ القيم الموجودة
                        var currentDate = DateTime.now();
                        var formattedCurrentDate =
                            DateFormat.yMEd().format(currentDate);
                        var noteModle = NoteModle(
                            title: title!,
                            subTitle: subTitle!,
                            date: DateTime.now.toString(),
                            color: Colors.blue.value);
                        BlocProvider.of<AddNoteCubit>(context)
                            .addNote(noteModle);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  );
                },
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
