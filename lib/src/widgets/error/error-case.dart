import 'package:flutter/material.dart';
import 'package:pkg_selfi/src/theme/colors.dart';

class ErrorCase extends StatelessWidget {
  final int errorCode;

  const ErrorCase({required this.errorCode});

  @override
  Widget build(BuildContext context) {
    String? title;
    String? bodyText;

    switch (errorCode) {
      case 400:
      case 401:
      case 403:
        {
          title = 'Lo sentimos, no pudimos validar tu documento de identidad';
          bodyText =
              'No se pudo validar el número del documento ingresado, al parecer no corresponde al usuario o este es menor de edad. Verifique sus datos e inténtelo de nuevo.';
        }
        break;
      case 404:
        {
          title = 'Lo sentimos, no pudimos validar tu documento de identidad';
          bodyText =
              'No se pudo validar el número del documento ingresado, al parecer no corresponde al usuario o este es menor de edad. Verifique sus datos e inténtelo de nuevo.';
        }
        break;
      case 429:
      default:
        {
          title = 'Ocurrió un error inesperado';
          bodyText =
              'No se puede continuar con la operación, verifique los datos ingresados';
        }
        break;
    }

    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: bluePacifico,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Text(
            bodyText,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
