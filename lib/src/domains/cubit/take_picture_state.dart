part of 'take_picture_cubit.dart';

@immutable
abstract class TakePictureState {}

class TakePictureInitial extends TakePictureState {}

class TakePictureWithImage extends TakePictureState {
  final File image;

  TakePictureWithImage(this.image);
}

class TakePictureFail extends TakePictureState {}

class TakePictureGoTo extends TakePictureState {}
