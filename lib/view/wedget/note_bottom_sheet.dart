import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';

import 'note_button_form_sheet.dart';

class NoteButtomSheet extends StatelessWidget {
  const NoteButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailur) {
              print("jh");
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
                absorbing: state is AddNoteLoading
                    ? true
                    : false, //اثناء لودينغ ممنوع يتعدل على شي بالتيست فيلد
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(child: Note_Buttom_Form_sheet()),
                ));
          },
        ),
      ),
    );
  }
}
