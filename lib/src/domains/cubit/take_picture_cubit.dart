import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pkg_selfi/src/domains/models/SelphiFaceWidget.dart';
import 'package:selphi_face_plugin/SelphiFaceFinishStatus.dart';

part 'take_picture_state.dart';

class TakePictureCubit extends Cubit<TakePictureState> {
  TakePictureCubit() : super(TakePictureInitial());

  void gotoSuccess() {
    emit(TakePictureGoTo());
  }

  SelphiFaceWidget _selphiFaceWidget = new SelphiFaceWidget();
  String _resourcesPath = "fphi-selphi-widget-resources-selphi-live-1.2";
  Uint8List? bestImage;

  String message = 'Preview selfie';
  Color textColorMessage = Color(0xFF0099af);

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

            print('=====> respuesta selphi');
            print(bestImage!.isEmpty);
            print(bestImage);

            emit(TakePictureWithImage(bestImage!));
          }
          break;
        case SelphiFaceFinishStatus.STATUS_ERROR: // Error
          {
            message = selphiFaceResult.errorMessage!;
            bestImage = null;
            textColorMessage = Colors.red[800]!;
            emit(TakePictureFail(message));
          }
          break;
        case SelphiFaceFinishStatus.STATUS_CANCEL_BY_USER: // CancelByUser
          {
            message = 'The user cancelled the process';
            bestImage = null;
            textColorMessage = Colors.amber[800]!;
            emit(TakePictureFail(message));
          }
          break;
        case SelphiFaceFinishStatus.STATUS_TIMEOUT: // Timeout
          {
            message = 'Process finished by timeout';
            bestImage = null;
            textColorMessage = Colors.amber[800]!;
            emit(TakePictureFail(message));
          }
          break;
      }
    });
  }
}
