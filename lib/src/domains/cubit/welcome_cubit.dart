import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pkg_selfi/src/domains/providers/selfi-provider-service.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeInitial());

  SelfiProviderService service = SelfiProviderService();

  bool btnActive = false;

  String? sessionToken;
  bool? isEnrolled;

  Future<void> validateInit(String token) async {
    //get session token
    final response = await service.getSessionToken(token);

    if (response.statusCode == 200) {
      final sessionTemp = jsonDecode(response.body);
      sessionToken = sessionTemp['token'];
      emit(WelcomeValidate());
    } else {
      emit(WelcomeValidate(
        validate: false,
        code: response.statusCode,
      ));
    }
  }

  getIsEnrolled() async {
    final response = await service.getIsEnrolled(sessionToken!);
    print('is enrolled');
    final isEnrolledTemp = jsonDecode(response.body);
    isEnrolled = isEnrolledTemp['isEnrolled'];

    print('==========================> enrolled');
    emit(WelcomeGoTo(
      isEnrolled: isEnrolled!,
      sessionToken: sessionToken!,
    ));
    print(state);
  }

  void btnPulse(bool active) {
    btnActive = active;
    emit(WelcomeValidate(btnActive: active));
  }

  void accepted() {
    emit(WelcomeAccepted());
  }

  // void gotoPicture() {
  //   emit(WelcomeGoTo());
  // }
}
