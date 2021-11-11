import 'package:flutter/material.dart';
import 'package:pkg_selfi/src/theme/colors.dart';

class ButtonSecondary extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Size? minimumSize;

  const ButtonSecondary({this.onPressed, required this.text, this.minimumSize});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        alignment: Alignment.center,
        primary: bluePacifico,
        side: BorderSide(color: bluePacifico),
        minimumSize: minimumSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Text(text),
    );
  }
}
