import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/conest.dart';
import 'package:noteapp/modle/note_modle.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModle>? notes;

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModle>(kNotesBox); //فتح الصندوق
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
