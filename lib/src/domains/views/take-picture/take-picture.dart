import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkg_selfi/src/domains/cubit/main_cubit.dart';
import 'package:pkg_selfi/src/domains/cubit/take_picture_cubit.dart';
import 'package:pkg_selfi/src/domains/views/take-picture/widgets/take-picture-content.dart';

class TakePictureView extends StatelessWidget {
  // final bool isEnrolled;
  // final String sessionToken;
  // const TakePictureView({required this.isEnrolled, required this.sessionToken});

  @override
  Widget build(BuildContext context) {
    var _mainCubit = BlocProvider.of<MainCubit>(context);
    return BlocProvider(
      create: (context) => TakePictureCubit(_mainCubit),
      //..launchSelphiAuthenticate()
      child: TakePictureContent(),
    );
  }
}
