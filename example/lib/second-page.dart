import 'package:flutter/material.dart';
import 'package:pkg_selfi/pkg_selfi.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SecondPage extends StatelessWidget {
  final accessToken = dotenv.env['TOKEN'];

  @override
  Widget build(BuildContext context) {
    return MainPkgView(
      token: accessToken!,
      trackingId: '1234',
      onSuccessPress: () => print('success press pkg'),
      onErrorPress: () => print('error press pkg'),
    );
  }
}
