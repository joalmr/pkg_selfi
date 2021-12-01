import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkg_selfi/src/domains/cubit/take_picture_cubit.dart';
import 'package:pkg_selfi/src/domains/views/success/success.dart';
import 'package:pkg_selfi/src/theme/colors.dart';
import 'package:pkg_selfi/src/widgets/button-primary/button-primary.dart';
import 'package:pkg_selfi/src/widgets/button-secondary/button-secondary.dart';
import 'package:pkg_selfi/src/widgets/selphi/selphi-image.dart';

class TakePictureView extends StatelessWidget {
  final bool isEnrolled;
  final String sessionToken;
  const TakePictureView({required this.isEnrolled, required this.sessionToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<TakePictureCubit, TakePictureState>(
          listener: (context, state) {
            if (state is TakePictureGoTo) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SuccesView()),
              );
            }
            if (state is TakePictureFail) {
              final snackBar =
                  SnackBar(content: Text('Error no se procesó la imagen'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
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
                  SelphiImage(context.read<TakePictureCubit>().bestImage),
                  (state is TakePictureInitial)
                      ? SizedBox(height: 0)
                      : Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ButtonPrimary(
                            onPressed: () => context
                                .read<TakePictureCubit>()
                                .validaPersona(isEnrolled, sessionToken),
                            text: 'Continuar',
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.60, 35),
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
