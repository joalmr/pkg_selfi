import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkg_selfi/src/domains/cubit/welcome_cubit.dart';
import 'package:pkg_selfi/src/domains/views/welcome/widgets/step/step.dart';

import 'advertisment/advertisment.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WelcomeCubit, WelcomeState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case WelcomeValidate:
                return AdvertismentView();
              case WelcomeAccepted:
                return StepView();
              case WelcomeInitial:
              default:
                return Scaffold();
            }
          },
        ),
      ),
    );
  }
}
