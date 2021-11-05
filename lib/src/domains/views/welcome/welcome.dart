import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:pkg_selfi/src/domains/cubit/welcome_cubit.dart';
import 'package:pkg_selfi/src/domains/views/take-picture/take-picture.dart';
import 'package:pkg_selfi/src/libs/dependency-injection/module-container.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

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
          bloc: BlocProvider.of<WelcomeCubit>(context),
          listener: (context, state) {
            if (state is WelcomeGoTo) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TakePictureView()),
              );
            } else if (state is WelcomeValidate &&
                context.read<WelcomeCubit>().validateView == false) {
              // final snackBar = SnackBar(
              //   content: Text('SnackBar!'),
              //   backgroundColor: Colors.red[200],
              //   action: SnackBarAction(
              //     textColor: Colors.white,
              //     label: 'Salir',
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //   ),
              // );

              final snackBar = SnackBar(
                backgroundColor: Colors.transparent,
                content: CustomSnackBar.error(
                  icon: const Icon(
                    Icons.sentiment_neutral,
                    color: const Color(0x15000000),
                    size: 120,
                  ),
                  message: 'Este es un snackbar de error',
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case WelcomeValidate:
                return AdvertismentView();
              case WelcomeAccepted:
                return StepView();
              case WelcomeInitial:
              default:
                return Scaffold(
                  body: Container(
                    color: Colors.red,
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
