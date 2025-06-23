import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:noteapp/modle/note_modle.dart';
import 'package:noteapp/view/wedget/custom_note_one.dart';

class NotesListView extends StatelessWidget {
  NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, State) {
      List<NoteModle> notes = BlocProvider.of<NotesCubit>(context).notes?? [];
      return ListView.builder(
          itemCount: notes.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, i) {
            return NoteOne(note: notes[i]);
          });
    });
  }
}
