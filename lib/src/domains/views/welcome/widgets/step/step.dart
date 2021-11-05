import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:pkg_selfi/src/domains/cubit/welcome_cubit.dart';
import 'package:pkg_selfi/src/domains/views/take-picture/take-picture.dart';
import 'package:pkg_selfi/src/theme/colors.dart';
import 'package:pkg_selfi/src/widgets/button-primary/button-primary.dart';
import 'package:pkg_selfi/src/widgets/button-secondary/button-secondary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepView extends StatelessWidget {
  const StepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeCubit, WelcomeState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: EasyRichText(
                'Validaremos tu identidad de formar sencilla',
                textAlign: TextAlign.center,
                defaultStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24,
                ),
                patternList: [
                  EasyRichTextPattern(
                    targetString: 'Validaremos',
                    style: TextStyle(color: bluePacifico),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              '''Recuerde de activar la cámara de su celular.''',
              style: TextStyle(color: Color(0xFF8b8d8e)),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: MediaQuery.of(context).size.width * 0.35,
                child: Column(
                  children: [
                    Image.asset(
                      'images/img-1.png',
                      package: 'pkg_selfi',
                      height: 100,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Mire de frente a la cámara',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    ButtonPrimary(
                      text: 'Comenzar',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context_) => AlertDialog(
                            title: Text(
                              'Antes de mirar a la cámara considera lo siguiente:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(7.5),
                                    width: 140,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'images/group-1.png',
                                          package: 'pkg_selfi',
                                        ),
                                        EasyRichText(
                                          'El lugar debe tener buena iluminación.',
                                          textAlign: TextAlign.center,
                                          defaultStyle: const TextStyle(
                                              color: Colors.black),
                                          patternList: [
                                            EasyRichTextPattern(
                                              targetString: 'buena iluminación',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(7.5),
                                    width: 140,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'images/group-2.png',
                                          package: 'pkg_selfi',
                                        ),
                                        EasyRichText(
                                          'Rostro descubierto, sin gafas ni prendas en la cabeza.',
                                          textAlign: TextAlign.center,
                                          defaultStyle: const TextStyle(
                                              color: Colors.black),
                                          patternList: [
                                            EasyRichTextPattern(
                                              targetString:
                                                  'Rostro descubierto',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(7.5),
                                    width: 140,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'images/group-3.png',
                                          package: 'pkg_selfi',
                                        ),
                                        EasyRichText(
                                          'Mira de frente a la cámara sin inclinar la cabeza.',
                                          textAlign: TextAlign.center,
                                          defaultStyle: const TextStyle(
                                              color: Colors.black),
                                          patternList: [
                                            EasyRichTextPattern(
                                              targetString:
                                                  'Mira de frente a la cámara',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  ButtonSecondary(
                                      text: 'Continuar',
                                      onPressed: () =>
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TakePictureView()),
                                          )),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: EasyRichText(
                '''Esta es una página segura de Pacífico Seguros. Si tienes alguna duda comunicate con nosotros al (01) 513 5020 o a través de nuestros medios digitales''',
                textAlign: TextAlign.justify,
                defaultStyle: const TextStyle(
                  color: Color(0xFF8b8d8e),
                ),
                patternList: [
                  EasyRichTextPattern(
                    targetString: 'Pacífico Seguros',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  EasyRichTextPattern(
                    targetString: '01',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  EasyRichTextPattern(
                    targetString: '513 5020',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
