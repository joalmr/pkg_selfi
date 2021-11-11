import 'package:flutter/material.dart';
import 'package:pkg_selfi/src/theme/colors.dart';
import 'package:pkg_selfi/src/widgets/button-primary/button-primary.dart';

class ErrorMsg extends StatelessWidget {
  final String title;
  final String bodyText;
  final void Function()? onPressed;
  const ErrorMsg({
    required this.title,
    required this.bodyText,
    this.onPressed,
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
