import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkg_selfi/src/domains/cubit/success_cubit.dart';
import 'package:pkg_selfi/src/domains/cubit/take_picture_cubit.dart';
import 'package:pkg_selfi/src/domains/cubit/welcome_cubit.dart';

import 'welcome/welcome.dart';

class MainView extends StatefulWidget {
  final String token;
  const MainView({Key? key, required this.token}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
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
      child: Scaffold(
        body: WelcomeView(token: widget.token),
      ),
    );
  }
}
