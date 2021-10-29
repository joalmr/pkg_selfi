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
      appBar: AppBar(
        title: Text(token),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => WelcomeCubit(),
          child: BlocConsumer<WelcomeCubit, WelcomeState>(
            listener: (context, state) {
              // if (state is WelcomeInvalidInitial) {
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text("Error token inválido"),
              //   ));
              // }
              if (state is WelcomeGoTo) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TakePictureView()),
                );
              }
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                // case WelcomeValidateInitial:
                //   return AdvertismentView();
                case WelcomeBtnPulse:
                  return AdvertismentView();
                case WelcomeAccepted:
                  return StepView();
                case WelcomeInitial:
                  return AdvertismentView();
                default:
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
