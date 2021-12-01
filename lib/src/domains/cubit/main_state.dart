part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainTakePicture extends MainState {}

class MainSuccess extends MainState {}

class MainError extends MainState {
  final int code;

  MainError(this.code);
}

class MainFail extends MainState {
  final String msg;

  MainFail(this.msg);
}
