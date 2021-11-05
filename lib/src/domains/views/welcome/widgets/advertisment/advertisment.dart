import 'package:flutter/material.dart';
import 'package:pkg_selfi/src/domains/cubit/welcome_cubit.dart';
import 'package:pkg_selfi/src/theme/colors.dart';
import 'package:pkg_selfi/src/widgets/button-primary/button-primary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvertismentView extends StatelessWidget {
  const AdvertismentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Uso de datos personales',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: bluePacifico,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Text(
                  '''Usted autoriza a Pacífico Seguros a recopilar y almacenar la información consignada en su documento de identidad, incluyendo su imagen, con la finalidad de verificar su identidad en ese y otros procesos que requieren autenticación.''',
                  style: TextStyle(color: Color(0xFF8b8d8e)),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Text(
                  '''Mantendremos su información hasta diez años después de que finalice su relación contractual con Pacífico. No transferiremos su información a terceros no autorizados.''',
                  style: TextStyle(color: Color(0xFF8b8d8e)),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            child: GestureDetector(
              onTap: () {
                context
                    .read<WelcomeCubit>()
                    .btnPulse(!context.read<WelcomeCubit>().btnActive);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.read<WelcomeCubit>().btnActive &&
                              context.read<WelcomeCubit>().validateView
                          ? greenPacifico
                          : Colors.grey[100],
                      border: Border.all(
                        color: greenPacifico,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: context.read<WelcomeCubit>().btnActive &&
                              context.read<WelcomeCubit>().validateView
                          ? Icon(
                              Icons.check,
                              size: 15.0,
                              color: Colors.white,
                            )
                          : Icon(
                              null,
                              size: 15.0,
                            ),
                    ),
                  ),
                  Text(
                    'Acepto términos y condiciones',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25),
          ButtonPrimary(
            text: 'Sí, Acepto',
            minimumSize: Size(MediaQuery.of(context).size.width * 0.60, 35),
            onPressed: context.read<WelcomeCubit>().btnActive &&
                    context.read<WelcomeCubit>().validateView
                ? () => context.read<WelcomeCubit>().accepted()
                : null,
          ),
        ],
      ),
    );
  }
}
