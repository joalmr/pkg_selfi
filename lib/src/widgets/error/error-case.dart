import 'package:flutter/material.dart';

import 'error-msg.dart';

class ErrorCase extends StatelessWidget {
  final int errorCode;
  final void Function()? onPressed;
  const ErrorCase({required this.errorCode, this.onPressed});

  @override
  Widget build(BuildContext context) {
    switch (errorCode) {
      case 400:
      case 401:
      case 403:
        return ErrorMsg(
          title: 'Lo sentimos, no pudimos validar tu documento de identidad',
          bodyText:
              'No se pudo validar el número del documento ingresado, al parecer no corresponde al usuario o este es menor de edad. Verifique sus datos e inténtelo de nuevo.',
          onPressed: onPressed,
        );
      case 404:
        return ErrorMsg(
          title: 'Lo sentimos, no pudimos validar tu documento de identidad',
          bodyText:
              'No se pudo validar el número del documento ingresado, al parecer no corresponde al usuario o este es menor de edad. Verifique sus datos e inténtelo de nuevo.',
          onPressed: onPressed,
        );
      case 429:
      default:
        return ErrorMsg(
          title: 'Ocurrió un error inesperado',
          bodyText:
              'No se puede continuar con la operación, verifique los datos ingresados',
          onPressed: onPressed,
        );
    }
  }
}
