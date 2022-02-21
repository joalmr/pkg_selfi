import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  String? bestImage;
  Uint8List? bestImageBase64;
  String? templateRaw;

  String message = 'Preview selfie';
  Color textColorMessage = Color(0xFF0099af);

  lanzaValida() {
    emit(TakePictureLoading());
    validaPersona();
  }

  validaPersona() async {
    if (bestImage!.isNotEmpty) {
      final response = await service.getInfoPerson(
        mainCubit.isEnrolled ?? false,
        templateRaw!.toString(),
        mainCubit.sessionToken ?? '',
        mainCubit.trackingId!,
        bestImage!,
        mainCubit.oauth!,
      );

      if (response.statusCode == 200) {
        print('=======> ir a success');
        emit(TakePictureLoaded());
        print(mainCubit.state);
        mainCubit.emit(MainSuccess());
      } else {
        emit(TakePictureLoaded());
        final errorTemp = jsonDecode(response.body);
        print('=======> error en templateraw');
        print(response.statusCode);
        print(response.body);
        mainCubit.goError(
          response.statusCode,
          errorTemp['error']['code'],
          errorTemp['error']['userMessage'],
        );
      }
    }
  }

// export const ModifyBase64Extension = (base64Image: string): string =>
// 	base64Image.replace(/^data:image\/(png|jpeg);base64,/, "");

  void launchSelphiAuthenticate() async {
    final selphiFaceWidgetResult =
        await _selphiFaceWidget.launchSelphiAuthenticate(_resourcesPath);

    return selphiFaceWidgetResult.fold((l) {
      message = l.toString();
      bestImage = null;
      templateRaw = null;
      textColorMessage = Colors.red[800]!;
    }, (r) {
      final selphiFaceResult = r;
      // Manage Plugin process Status
      switch (selphiFaceResult.finishStatus) {
        case SelphiFaceFinishStatus.STATUS_OK: // OK
          {
            // print('============> template raw');
            // print(selphiFaceResult.templateRaw.toString());
            // print('============> best image');
            // print(selphiFaceResult.bestImage.toString());

            templateRaw = selphiFaceResult.templateRaw.toString();
            message = 'Preview Selfie';
            bestImage = selphiFaceResult.bestImage!;
            bestImageBase64 = base64Decode(selphiFaceResult.bestImage!);
            textColorMessage = Color(0xFF0099af);

            emit(TakePictureWithImage(
                base64Decode(selphiFaceResult.bestImage!)));
          }
          break;
        case SelphiFaceFinishStatus.STATUS_ERROR: // Error
          {
            message = selphiFaceResult.errorMessage!;
            bestImage = null;
            templateRaw = null;
            textColorMessage = Colors.red[800]!;
            mainCubit.emit(MainFail(message));
          }
          break;
        case SelphiFaceFinishStatus.STATUS_CANCEL_BY_USER: // CancelByUser
          {
            message = 'El usuario canceló el proceso';
            bestImage = null;
            templateRaw = null;
            textColorMessage = Colors.amber[800]!;
            mainCubit.emit(MainFail(message));
          }
          break;
        case SelphiFaceFinishStatus.STATUS_TIMEOUT: // Timeout
          {
            message = 'Proceso terminado por tiempo de espera';
            bestImage = null;
            templateRaw = null;
            textColorMessage = Colors.amber[800]!;
            mainCubit.emit(MainFail(message));
          }
          break;
      }
    });
  }
}
