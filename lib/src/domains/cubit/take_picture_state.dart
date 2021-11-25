part of 'take_picture_cubit.dart';

@immutable
abstract class TakePictureState {}

class TakePictureInitial extends TakePictureState {}

class TakePictureWithImage extends TakePictureState {
  final Uint8List image;

  TakePictureWithImage(this.image);
}

class TakePictureFail extends TakePictureState {
  final String msg;

  TakePictureFail(this.msg);
}

class TakePictureGoTo extends TakePictureState {}
