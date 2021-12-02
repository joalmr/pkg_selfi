// import 'package:flutter/material.dart';
// import 'package:pkg_selfi/src/theme/colors.dart';

// import 'error-title.dart';

// class ErrorCase extends StatelessWidget {
//   final String errorCode;

//   const ErrorCase({required this.errorCode});

//   @override
//   Widget build(BuildContext context) {
//     String? bodyText;

//     switch (errorCode) {
//       case 400:
//       case 401:
//       case 403:
//         {
//           bodyText =
//               'No se pudo validar el número del documento ingresado, al parecer no corresponde al usuario o este es menor de edad. Verifique sus datos e inténtelo de nuevo.';
//         }
//         break;
//       case 404:
//         {
//           bodyText =
//               'No se pudo validar el número del documento ingresado, al parecer no corresponde al usuario o este es menor de edad. Verifique sus datos e inténtelo de nuevo.';
//         }
//         break;
//       case 429:
//       default:
//         {
//           bodyText =
//               'No se puede continuar con la operación, verifique los datos ingresados';
//         }
//         break;
//     }

//     return Column(
//       children: [
        
//       ],
//     );
//   }
// }
