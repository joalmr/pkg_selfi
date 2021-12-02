import 'package:flutter/material.dart';
import 'package:pkg_selfi/src/theme/colors.dart';
import 'package:pkg_selfi/src/widgets/button-primary/button-primary.dart';

import 'error-title.dart';

class ErrorMsg extends StatelessWidget {
  final String errorCode;
  final String errorUserMessage;
  final void Function() onErrorPress;

  const ErrorMsg({
    required this.errorCode,
    required this.errorUserMessage,
    required this.onErrorPress,
  });

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
              // ErrorCase(errorCode: errorCode),
              Text(
                errorTitle[errorCode]!,
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
                  errorUserMessage,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              ButtonPrimary(
                text: 'Vuelva a intentarlo',
                onPressed: onErrorPress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
