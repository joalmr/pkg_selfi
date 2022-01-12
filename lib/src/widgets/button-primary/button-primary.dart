import 'package:flutter/material.dart';
import 'package:pkg_selfi/src/domains/cubit/main_cubit.dart';
import 'package:pkg_selfi/src/theme/colors.dart';

class ButtonPrimary extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Size? minimumSize;
  final bool cargando;

  const ButtonPrimary({
    this.onPressed,
    required this.text,
    this.minimumSize,
    this.cargando = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(cargando ? 'Cargando..' : text),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        alignment: Alignment.center,
        primary: Colors.white,
        backgroundColor: onPressed == null ? Color(0xFFbababa) : greenPacifico,
        side: BorderSide(
            color: onPressed == null ? Color(0xFFbababa) : greenPacifico),
        minimumSize: minimumSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
