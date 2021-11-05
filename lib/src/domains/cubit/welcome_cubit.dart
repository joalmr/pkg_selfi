import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeInitial());

  bool btnActive = false;

  void validateInit(String token) {
    print(token);
    if (token == "tokenBlabla") {
      emit(WelcomeValidate());
    } else {
      emit(WelcomeValidate(validate: false));
      print(state);
    }
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
