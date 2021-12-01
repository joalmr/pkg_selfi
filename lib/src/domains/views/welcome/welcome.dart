import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkg_selfi/src/domains/cubit/main_cubit.dart';
import 'package:pkg_selfi/src/domains/cubit/welcome_cubit.dart';

import 'widgets/welcome-content.dart';

class WelcomeView extends StatelessWidget {
  // final injector = ModuleContainer().initialize(Injector());
  final String token;
  WelcomeView({required this.token});

  @override
  Widget build(BuildContext context) {
    var _mainCubit = BlocProvider.of<MainCubit>(context);
    return BlocProvider(
      create: (context) => WelcomeCubit(_mainCubit)..validateInit(token),
      child: WelcomeContent(),
    );
  }
}
