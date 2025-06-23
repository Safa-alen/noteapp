import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:noteapp/view/wedget/custom_appbar.dart';

import 'package:noteapp/view/wedget/notes_list_view.dart';

import 'wedget/note_bottom_sheet.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true, //مشان يرتفع للكيبورد
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                context: context,
                builder: (context) {
                  return NoteButtomSheet();
                });
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const CustomAppbar(
                icon: Icon(Icons.search),
                text: "Notes",
              ),
              Expanded(child: NotesListView())
            ],
          ),
        ),
      ),
    );
  }
}
