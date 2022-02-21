import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:pkg_selfi/src/widgets/error/error-title.dart';

import 'navigation/navigation_cubit.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final NavigationCubit navigationCubit;
  MainCubit(this.navigationCubit) : super(MainInitial());

  String? oauth;
  String? sessionToken;
  String? trackingId;
  bool? isEnrolled;

  bool? dataReturn;

  void navigationEvent() {}

  void goError(int statusCode, String? code, String? userMessage) {
    dataReturn = false;
    emit(
      MainError(
        statusCode,
        code ?? 'Ocurrió un error inesperado',
        userMessage ??
            'No se puede continuar con la operación, verifique los datos ingresados',
      ),
    );

    // var errorPkg = {
    //   'error': 'Error package selphi',
    //   'message': errorTitle[code],
    //   'description': userMessage,
    //   'code': code,
    //   'statusCode': statusCode,
    // };
  }
}
