import 'package:flutter/material.dart';
import 'package:noteapp/view/wedget/custom_appbar.dart';
import 'package:noteapp/view/wedget/custom_text_field.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            CustomAppbar(
              icon: Icon(Icons.check_sharp),
              text: "Edit Note",
            ),
            SizedBox(
              height: 25,
            ),
            Column(children: [
              CustomTextField(hint: "Title"),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                hint: "Content",
                maxlines: 5,
              )
            ])
          ],
        ),
      ),
    );
  }
}
