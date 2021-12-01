import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'navigation/navigation_cubit.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final NavigationCubit navigationCubit;
  MainCubit(this.navigationCubit) : super(MainInitial());

  String? sessionToken;
  bool? isEnrolled;

  bool? dataReturn;

  void navigationEvent() {}

  void goError(int code) {
    dataReturn = false;
    emit(MainError(code));
  }
}
