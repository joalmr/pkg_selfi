import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pkg_selfi/src/domains/providers/selfi-provider-service.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeInitial());

  SelfiProviderService service = SelfiProviderService();

  bool btnActive = false;

  Future<void> validateInit(String token) async {
    print(token);
    final response = await service.getSessionToken(token);

    print(response.statusCode);
    if (response.statusCode == 200) {
      emit(WelcomeValidate());
    } else {
      emit(WelcomeValidate(validate: false));
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
