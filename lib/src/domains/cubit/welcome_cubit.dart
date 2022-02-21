import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pkg_selfi/src/domains/cubit/main_cubit.dart';
import 'package:pkg_selfi/src/domains/providers/selfi-provider-service.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  final MainCubit mainCubit;
  WelcomeCubit(this.mainCubit) : super(WelcomeInitial());

  SelfiProviderService service = SelfiProviderService();

  bool btnActive = false;

  Future<void> validateInit(String token, String trackingId) async {
    //get session token
    mainCubit.trackingId = trackingId;
    final responseOauth = await service.getOAuth('a8c13a54-361b-4315-aa95-dba1cdf7e96a');
    if(responseOauth.statusCode==200){
      final sessionOauth = jsonDecode(responseOauth.body);
      mainCubit.oauth = sessionOauth['access_token'];

      final response = await service.getSessionToken(token, trackingId, mainCubit.oauth!);

      print('=====> validateInit');
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final sessionTemp = jsonDecode(response.body);
        mainCubit.sessionToken = sessionTemp['token'];
        emit(WelcomeValidate());
      } else {
        final errorTemp = jsonDecode(response.body);
        mainCubit.goError(
          response.statusCode,
          errorTemp['error']['code'],
          errorTemp['error']['userMessage'],
        );
      }
    }

    
  }

  getIsEnrolled() async {
    final response = await service.getIsEnrolled(
      mainCubit.sessionToken!,
      mainCubit.trackingId!,
      mainCubit.oauth!,
    );

    final isEnrolledTemp = jsonDecode(response.body);
    mainCubit.isEnrolled = isEnrolledTemp['isEnrolled'];

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
