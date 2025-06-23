import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/conest.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:noteapp/modle/note_modle.dart';
import 'package:noteapp/simple_bloc_observer.dart';

import 'package:noteapp/view/homepage.dart';

void main() async {
  await Hive.initFlutter(); //تهيئة hive للعمل

  Bloc.observer =
      SimpleBlocObserver(); //يُستخدم في تطبيقات Flutter التي تعتمد على مكتبة flutter_bloc لتسجيل مراقب عام لجميع الأحداث والتغييرات التي تحدث داخل الـ Bloc أو Cubit.
  Hive.registerAdapter(
      NoteModleAdapter()); //هو أمر لتسجيل Adapter مخصص من أجل استخدامه مع مكتبة Hive لتخزين البيانات محليًا

  await Hive.openBox<AddNoteCubit>(
      kNotesBox); //يُستخدم لفتح صندوق (Box) في Hive، وهو المكان الذي يتم فيه تخزين البيانات.

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Homepage(),
    );
  }
}
