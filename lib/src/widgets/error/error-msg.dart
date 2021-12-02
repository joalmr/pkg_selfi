import 'package:flutter/material.dart';
import 'package:pkg_selfi/src/widgets/button-primary/button-primary.dart';

import 'error-case.dart';

class ErrorMsg extends StatelessWidget {
  final int errorCode;
  final void Function()? onPressed;
  const ErrorMsg({required this.errorCode, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/error.png',
                package: 'pkg_selfi',
              ),
              ErrorCase(errorCode: errorCode),
              SizedBox(height: 30),
              ButtonPrimary(
                text: 'Vuelva a intentarlo',
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
