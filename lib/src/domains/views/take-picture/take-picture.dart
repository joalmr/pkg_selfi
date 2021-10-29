import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkg_selfi/src/domains/cubit/take_picture_cubit.dart';
import 'package:pkg_selfi/src/domains/views/success/success.dart';
import 'package:pkg_selfi/src/theme/colors.dart';
import 'package:pkg_selfi/src/widgets/button-primary/button-primary.dart';
import 'package:pkg_selfi/src/widgets/button-secondary/button-secondary.dart';

class TakePictureView extends StatelessWidget {
  const TakePictureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TakePictureCubit(),
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
          return Scaffold(
            body: SafeArea(
              child: Container(
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
                    SizedBox(height: 10),
                    if (state is TakePictureInitial || state is TakePictureFail)
                      InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          radius: 80,
                        ),
                      ),
                    if (state is TakePictureWithImage)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Placeholder(
                          fallbackHeight: 160,
                          fallbackWidth: 160,
                        ),
                        // Image(
                        //   image: FileImage(
                        //       context.read<TakePictureCubit>().image!),
                        //   fit: BoxFit.cover,
                        //   height: 160,
                        //   width: 160,
                        // ),
                      ),
                    SizedBox(height: 10),
                    ButtonPrimary(
                      onPressed: (state is TakePictureInitial ||
                              state is TakePictureFail)
                          ? null
                          : () =>
                              context.read<TakePictureCubit>().gotoSuccess(),
                      text: 'Continuar',
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.60, 35),
                    ),
                    SizedBox(height: 10),
                    ButtonSecondary(
                      onPressed: () {},
                      text: 'Volver a tomar la foto',
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.60, 35),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
