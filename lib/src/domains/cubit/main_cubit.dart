import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import 'navigation/navigation_cubit.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final NavigationCubit navigationCubit;
  MainCubit(this.navigationCubit) : super(MainInitial());

  String? sessionToken;
  bool? isEnrolled;

  bool? dataReturn;

  void navigationEvent() {}

  void goError(int code) {
    dataReturn = false;
    emit(MainError(code));

    String title;
    String message;
    switch (code) {
      case 400:
      case 401:
      case 403:
        {
          title = 'Lo sentimos, no pudimos validar tu documento de identidad';
          message =
              'No se pudo validar el número del documento ingresado, al parecer no corresponde al usuario o este es menor de edad. Verifique sus datos e inténtelo de nuevo.';
        }
        break;
      case 404:
        {
          title = 'Lo sentimos, no pudimos validar tu documento de identidad';
          message =
              'No se pudo validar el número del documento ingresado, al parecer no corresponde al usuario o este es menor de edad. Verifique sus datos e inténtelo de nuevo.';
        }
        break;
      case 429:
      default:
        {
          title = 'Ocurrió un error inesperado';
          message =
              'No se puede continuar con la operación, verifique los datos ingresados';
        }
        break;
    }
    var errorPkg = {
      'error': 'Error package selphi',
      'message': title,
      'description': message,
      'code': code,
    };
    throw Exception(errorPkg);
  }
}
