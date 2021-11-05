import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeInitial());

  bool btnActive = false;
  bool validateView = false;

  void validateInit(String token) {
    print(token);
    if (token == "tokenBlabla") {
      validateView = true;
    } else {
      print(state);
    }
    emit(WelcomeValidate());
  }

  void btnPulse(bool active) {
    btnActive = active;
    emit(WelcomeValidate(btnActive: active));
  }

  void accepted() {
    emit(WelcomeAccepted());
  }

  void gotoPicture() {
    emit(WelcomeGoTo());
  }
}
