import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pkg_selfi/src/domains/models/SelphiFaceWidget.dart';
import 'package:pkg_selfi/src/domains/providers/selfi-provider-service.dart';
import 'package:pkg_selfi/src/domains/views/success/success.dart';
import 'package:selphi_face_plugin/SelphiFaceFinishStatus.dart';

import 'main_cubit.dart';

part 'take_picture_state.dart';

class TakePictureCubit extends Cubit<TakePictureState> {
  final MainCubit mainCubit;
  TakePictureCubit(this.mainCubit) : super(TakePictureInitial());

  SelfiProviderService service = SelfiProviderService();

  void gotoSuccess() {
    emit(TakePictureGoTo());
  }

  SelphiFaceWidget _selphiFaceWidget = new SelphiFaceWidget();
  String _resourcesPath = "fphi-selphi-widget-resources-selphi-live-1.2";
  Uint8List? bestImage;

  String message = 'Preview selfie';
  Color textColorMessage = Color(0xFF0099af);

  validaPersona() async {
    if (bestImage!.isNotEmpty) {
      final response = await service.getInfoPerson(
        mainCubit.isEnrolled ?? false,
        bestImage!.toString(),
        mainCubit.sessionToken ?? '',
        mainCubit.trackingId!,
      );
      if (response.statusCode == 200) {
        print('=======> ir a success');
        mainCubit.emit(MainSuccess());

        print('===================> valida Persona');
      } else {
        //
        final errorTemp = jsonDecode(response.body);
        print('=======> error en templateraw');
        print(response.body);
        mainCubit.goError(
          response.statusCode,
          errorTemp['error']['code'],
          errorTemp['error']['userMessage'],
        );
      }
    }
  }

  void launchSelphiAuthenticate() async {
    final selphiFaceWidgetResult =
        await _selphiFaceWidget.launchSelphiAuthenticate(_resourcesPath);

    return selphiFaceWidgetResult.fold((l) {
      message = l.toString();
      bestImage = null;
      textColorMessage = Colors.red[800]!;
    }, (r) {
      final selphiFaceResult = r;
      // Manage Plugin process Status
      switch (selphiFaceResult.finishStatus) {
        case SelphiFaceFinishStatus.STATUS_OK: // OK
          {
            message = 'Preview Selfie';
            bestImage = base64Decode(selphiFaceResult.bestImage!);
            textColorMessage = Color(0xFF0099af);

            emit(TakePictureWithImage(bestImage!));
          }
          break;
        case SelphiFaceFinishStatus.STATUS_ERROR: // Error
          {
            message = selphiFaceResult.errorMessage!;
            bestImage = null;
            textColorMessage = Colors.red[800]!;
            mainCubit.emit(MainFail(message));
          }
          break;
        case SelphiFaceFinishStatus.STATUS_CANCEL_BY_USER: // CancelByUser
          {
            message = 'The user cancelled the process';
            bestImage = null;
            textColorMessage = Colors.amber[800]!;
            mainCubit.emit(MainFail(message));
          }
          break;
        case SelphiFaceFinishStatus.STATUS_TIMEOUT: // Timeout
          {
            message = 'Process finished by timeout';
            bestImage = null;
            textColorMessage = Colors.amber[800]!;
            mainCubit.emit(MainFail(message));
          }
          break;
      }
    });
  }
}
