import 'package:flutter/material.dart';
import 'package:pkg_selfi/src/theme/colors.dart';
import 'package:pkg_selfi/src/widgets/button-primary/button-primary.dart';

class SuccesView extends StatelessWidget {
  const SuccesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'bodyText',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: bluePacifico,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '¡Tu identidad fue verificada con éxito!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  // color: bluePacifico,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              Image.asset(
                'images/like.png',
                package: 'pkg_selfi',
              ),
              SizedBox(height: 35),
              ButtonPrimary(
                text: 'Continuar',
                minimumSize: Size(MediaQuery.of(context).size.width * 0.45, 35),
                onPressed: () => print('salir'), //for git
              ),
            ],
          ),
        ),
      ),
    );
  }
}
