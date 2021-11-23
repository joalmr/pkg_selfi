import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:pkg_selfi/src/domains/cubit/welcome_cubit.dart';
import 'package:pkg_selfi/src/domains/views/take-picture/take-picture.dart';
import 'package:pkg_selfi/src/libs/dependency-injection/module-container.dart';
import 'package:pkg_selfi/src/widgets/error/error-case.dart';

import 'widgets/advertisment/advertisment.dart';
import 'widgets/step/step.dart';

class WelcomeView extends StatelessWidget {
  final injector = ModuleContainer().initialize(Injector());
  final String token;
  WelcomeView({required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<WelcomeCubit, WelcomeState>(
          // bloc: BlocProvider.of<WelcomeCubit>(context),
          listener: (context, state) {
            if (state is WelcomeGoTo) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TakePictureView()),
              );
            }
            // else if ((context.read<WelcomeCubit>().state as WelcomeValidate)
            //         .validate ==
            //     false) {
            // }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case WelcomeValidate:
                {
                  if ((state as WelcomeValidate).validate) {
                    return AdvertismentView();
                  } else {
                    return ErrorCase(
                      errorCode: state.code,
                      onPressed: () {},
                    );
                  }
                }
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
