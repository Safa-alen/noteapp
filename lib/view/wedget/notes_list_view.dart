import 'package:flutter/material.dart';
import 'package:noteapp/view/wedget/custom_note_one.dart';

class NotesListView extends StatelessWidget {
  NotesListView({super.key});
  final List notes =[

];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, i) {
          return NoteOne();
        });
  }
}
