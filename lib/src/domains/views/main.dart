import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkg_selfi/src/domains/cubit/success_cubit.dart';
import 'package:pkg_selfi/src/domains/cubit/take_picture_cubit.dart';
import 'package:pkg_selfi/src/domains/cubit/welcome_cubit.dart';

import 'welcome/welcome.dart';

class MainPkgView extends StatefulWidget {
  final String token;
  const MainPkgView({Key? key, required this.token}) : super(key: key);

  @override
  State<MainPkgView> createState() => _MainPkgViewState();
}

class _MainPkgViewState extends State<MainPkgView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            lazy: true,
            create: (context) => WelcomeCubit()..validateInit(widget.token)),
        BlocProvider(create: (context) => TakePictureCubit()),
        BlocProvider(create: (context) => SuccessCubit()),
      ],
      child: WelcomeView(token: widget.token),
    );
  }
}
