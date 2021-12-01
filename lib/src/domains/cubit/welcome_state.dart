part of 'welcome_cubit.dart';

@immutable
abstract class WelcomeState {}

class WelcomeInitial extends WelcomeState {}

class WelcomeValidate extends WelcomeState {
  final bool btnActive;

  WelcomeValidate({
    this.btnActive = false,
  });
}

class WelcomeAccepted extends WelcomeState {}

class WelcomeGoTo extends WelcomeState {}
