import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:noteapp/cubits/Add_Notes/add_note_cubit.dart';

import 'note_button_form_sheet.dart';

class NoteButtomSheet extends StatelessWidget {
  const NoteButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailur) {
          print("jh");
        }
        if (state is AddNoteSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ModalProgressHUD(
              inAsyncCall: state is AddNoteLoading
                  ? true
                  : false, //عرض موشر التحميل يغطي كامل الشاشة عند التصال بقاعدة بيانات
              child: Note_Buttom_Form_sheet()),
        );
      },
    );
  }
}
