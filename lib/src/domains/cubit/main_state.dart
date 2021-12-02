part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainTakePicture extends MainState {}

class MainSuccess extends MainState {}

class MainError extends MainState {
  final int statusCode;
  final String code;
  final String userMessage;

  MainError(this.statusCode, this.code, this.userMessage);
}

class MainFail extends MainState {
  final String msg;

  MainFail(this.msg);
}
