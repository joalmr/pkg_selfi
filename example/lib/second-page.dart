import 'package:flutter/material.dart';
import 'package:pkg_selfi/pkg_selfi.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accessToken = dotenv.env['TOKEN'];
    return MainPkgView(
      token: accessToken!,
      trackId: 'trackId',
    );
  }
}
