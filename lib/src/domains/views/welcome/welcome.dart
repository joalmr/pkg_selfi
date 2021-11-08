import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:pkg_selfi/src/domains/cubit/welcome_cubit.dart';
import 'package:pkg_selfi/src/domains/views/take-picture/take-picture.dart';
import 'package:pkg_selfi/src/libs/dependency-injection/module-container.dart';
import 'package:pkg_selfi/src/theme/colors.dart';
import 'package:pkg_selfi/src/widgets/button-primary/button-primary.dart';

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
                    return Container(
                      margin: EdgeInsets.all(25),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/error.png',
                              package: 'pkg_selfi',
                            ),
                            Text(
                              'Ocurrió un error inesperado',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: bluePacifico,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 5,
                              ),
                              child: Text(
                                'No se puede continuar con la operación, verifique los datos.',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 30),
                            ButtonPrimary(
                              text: 'Vuelva a intentarlo',
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
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
