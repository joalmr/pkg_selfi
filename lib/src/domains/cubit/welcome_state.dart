part of 'welcome_cubit.dart';

@immutable
abstract class WelcomeState {}

class WelcomeInitial extends WelcomeState {}

class WelcomeValidateInitial extends WelcomeState {}

class WelcomeInvalidInitial extends WelcomeState {}

class WelcomeBtnPulse extends WelcomeState {
  final bool btnActive;

  WelcomeBtnPulse(this.btnActive);
}

class WelcomeAccepted extends WelcomeState {}

class WelcomeGoTo extends WelcomeState {}
