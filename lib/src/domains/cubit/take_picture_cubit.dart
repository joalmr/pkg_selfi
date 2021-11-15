import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'take_picture_state.dart';

class TakePictureCubit extends Cubit<TakePictureState> {
  TakePictureCubit() : super(TakePictureInitial());

  Uint8List? bestImage;

  // File? image;

  // seleccionarFoto() async {
  //   await _procesarFoto(ImageSource.camera);
  // }

  // Future<void> _procesarFoto(ImageSource origen) async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: origen, imageQuality: 80);
  //   if (pickedFile != null) {
  //     image = File(pickedFile.path);
  //     emit(TakePictureWithImage(image!));
  //   } else {
  //     emit(TakePictureFail());
  //   }
  // }

  void gotoSuccess() {
    emit(TakePictureGoTo());
  }

  // Future<void> _procesarFoto2(ImageSource origen) async {
  //   try {
  //     final pickedFile = await selfiRepository.validate();
  //     emit(TakePictureWithImage(image!));
  //   } catch (e) {
  //     emit(TakePictureFail(e));
  //   }
  // }
}
