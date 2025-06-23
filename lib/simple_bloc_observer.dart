import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// مراقية كل العمليات  التي تحصل داخل cubit
class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    //من اجل تغيرات state
    debugPrint('change=$change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('close=$bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('oncreate=$bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
