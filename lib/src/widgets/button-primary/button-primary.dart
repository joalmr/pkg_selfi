import 'package:flutter/material.dart';
import 'package:pkg_selfi/src/theme/colors.dart';

class ButtonPrimary extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Size? minimumSize;

  const ButtonPrimary({this.onPressed, required this.text, this.minimumSize});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        alignment: Alignment.center,
        primary: Colors.white,
        backgroundColor: greenPacifico,
        side: BorderSide(color: greenPacifico),
        minimumSize: minimumSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
