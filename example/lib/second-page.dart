import 'package:flutter/material.dart';
import 'package:pkg_selfi/pkg_selfi.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SecondPage extends StatelessWidget {
  final accessToken = dotenv.env['TOKEN'];

  @override
  Widget build(BuildContext context) {
    return MainPkgView(
      token: accessToken!,
      trackId: 'trackId',
      onChanged: (value) {
        print(value);
        if (value == false) {
          Navigator.of(context).pop();
        } else if (value == true) {
          print('ok');
        }
      },
    );
  }
}
