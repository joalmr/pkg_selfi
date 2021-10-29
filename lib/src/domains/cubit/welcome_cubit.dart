import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeInitial());

  bool btnActive = false;

  void validateInit(String token) {
    if (token == "tokenBlabla2") {
      emit(WelcomeValidateInitial());
    } else {
      print('error');
      emit(WelcomeInvalidInitial());
    }
  }

  void btnPulse(bool active) {
    btnActive = active;
    emit(WelcomeBtnPulse(active));
  }

  void accepted() {
    emit(WelcomeAccepted());
  }

  void gotoPicture() {
    print("go to 1");
    emit(WelcomeGoTo());
  }
}
