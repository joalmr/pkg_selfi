import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:pkg_selfi/src/domains/cubit/welcome_cubit.dart';
import 'package:pkg_selfi/src/domains/views/take-picture/take-picture.dart';
import 'package:pkg_selfi/src/libs/dependency-injection/module-container.dart';

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
          listener: (context, state) {
            if (state is WelcomeGoTo) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TakePictureView()),
              );
            } else if (state is WelcomeValidate && state.validate == false) {
              print('print WelcomeInvalid');
              final snackBar = SnackBar(content: Text('SnackBar!'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case WelcomeValidate:
                return AdvertismentView();
              case WelcomeAccepted:
                return StepView();
              // case WelcomeInvalid:
              //   return Scaffold(
              //     body: Center(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text('Token inválido'),
              //           ButtonPrimary(
              //             text: 'Salir',
              //             onPressed: () {
              //               Navigator.of(context).pop();
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //   );
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
