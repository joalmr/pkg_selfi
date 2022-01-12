import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkg_selfi/src/domains/cubit/take_picture_cubit.dart';
import 'package:pkg_selfi/src/theme/colors.dart';
import 'package:pkg_selfi/src/widgets/button-primary/button-primary.dart';
import 'package:pkg_selfi/src/widgets/button-secondary/button-secondary.dart';
import 'package:pkg_selfi/src/widgets/selphi/selphi-image.dart';

class TakePictureContent extends StatelessWidget {
  const TakePictureContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TakePictureCubit, TakePictureState>(
          builder: (context, state) {
            return Container(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Resultado de la foto',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: bluePacifico,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 20),
                  SelphiImage(context.read<TakePictureCubit>().bestImageBase64),
                  (state is TakePictureInitial)
                      ? SizedBox(height: 0)
                      : Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ButtonPrimary(
                            onPressed: () =>
                                context.read<TakePictureCubit>().lanzaValida(),
                            text: 'Continuar',
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.60, 35),
                            cargando:
                                (state is TakePictureLoading) ? true : false,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ButtonSecondary(
                      onPressed: () => context
                          .read<TakePictureCubit>()
                          .launchSelphiAuthenticate(),
                      text: (state is TakePictureInitial)
                          ? 'Tomar foto'
                          : 'Volver a tomar foto',
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.60, 35),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
