part of 'welcome_cubit.dart';

@immutable
abstract class WelcomeState {}

class WelcomeInitial extends WelcomeState {}

class WelcomeValidate extends WelcomeState {
  final bool btnActive;
  final bool validate;

  WelcomeValidate({this.validate = true, this.btnActive = false});
}

// class WelcomeInvalid extends WelcomeState {}

class WelcomeAccepted extends WelcomeState {}

class WelcomeGoTo extends WelcomeState {}
