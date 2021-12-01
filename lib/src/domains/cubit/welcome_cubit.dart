import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pkg_selfi/src/domains/cubit/main_cubit.dart';
import 'package:pkg_selfi/src/domains/providers/selfi-provider-service.dart';
import 'package:pkg_selfi/src/domains/views/take-picture/take-picture.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  final MainCubit mainCubit;
  WelcomeCubit(this.mainCubit) : super(WelcomeInitial());

  SelfiProviderService service = SelfiProviderService();

  bool btnActive = false;

  Future<void> validateInit(String token) async {
    //get session token
    final response = await service.getSessionToken(token);

    if (response.statusCode == 200) {
      final sessionTemp = jsonDecode(response.body);
      mainCubit.sessionToken = sessionTemp['token'];
      emit(WelcomeValidate());
    } else {
      mainCubit.goError(response.statusCode);
    }
  }

  getIsEnrolled() async {
    final response = await service.getIsEnrolled(mainCubit.sessionToken!);
    print('is enrolled');
    final isEnrolledTemp = jsonDecode(response.body);
    mainCubit.isEnrolled = isEnrolledTemp['isEnrolled'];

    print('==========================> enrolled');
    print('==========================> ir a take picture');

    mainCubit.emit(MainTakePicture());
  }

  void btnPulse(bool active) {
    btnActive = active;
    emit(WelcomeValidate(btnActive: active));
  }

  void accepted() {
    emit(WelcomeAccepted());
  }
}
