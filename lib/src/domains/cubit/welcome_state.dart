part of 'welcome_cubit.dart';

@immutable
abstract class WelcomeState {}

class WelcomeInitial extends WelcomeState {}

class WelcomeValidate extends WelcomeState {
  final bool btnActive;
  final bool validate;
  final int code;

  WelcomeValidate({
    this.validate = true,
    this.btnActive = false,
    this.code = 200,
  });
}

// class WelcomeInvalid extends WelcomeState {}

class WelcomeAccepted extends WelcomeState {}

class WelcomeGoTo extends WelcomeState {
  final bool isEnrolled;
  final String sessionToken;

  WelcomeGoTo({
    this.isEnrolled = false,
    this.sessionToken = '',
  });
}
