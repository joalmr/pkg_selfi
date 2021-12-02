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

  Future<void> validateInit(String token, String trackingId) async {
    //get session token
    mainCubit.trackingId = trackingId;
    final response = await service.getSessionToken(token, trackingId);

    if (response.statusCode == 200) {
      final sessionTemp = jsonDecode(response.body);
      mainCubit.sessionToken = sessionTemp['token'];
      emit(WelcomeValidate());
    } else {
      // {"error":{"systemMessage":"El token presente se encuentra expirado","userMessage":"El token presente se encuentra expirado","traceId":"123454364636","code":"01.02.02"}}
      final errorTemp = jsonDecode(response.body);
      final String code = errorTemp['code'] ?? '';
      final String userMessage = errorTemp['userMessage'] ?? '';
      mainCubit.goError(response.statusCode, code, userMessage);
    }
  }

  getIsEnrolled() async {
    final response = await service.getIsEnrolled(
      mainCubit.sessionToken!,
      mainCubit.trackingId!,
    );
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
