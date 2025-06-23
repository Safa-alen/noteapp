import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/conest.dart';
import 'package:noteapp/modle/note_modle.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModle note) async {
    emit(AddNoteLoading());

    try {
      var notesBox = Hive.box<NoteModle>(kNotesBox); //فتح الصندوق
      await notesBox.add(note); //اضافة الملاحظة

      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailur(errMasseg: e.toString()));
    }
  }
}
