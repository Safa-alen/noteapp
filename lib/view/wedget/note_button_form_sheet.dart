import 'package:flutter/widgets.dart';
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
  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
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
              CustomButtom(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    //اذا كانت الحالة الحالية للنموذج صحيحة
                    formkey.currentState!.save(); //احفظ القيم الموجودة
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
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
