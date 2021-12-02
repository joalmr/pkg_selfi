import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkg_selfi/src/domains/cubit/main_cubit.dart';
import 'package:pkg_selfi/src/domains/cubit/success_cubit.dart';

import 'success-content.dart';

class SuccesView extends StatelessWidget {
  final void Function() onSuccessPress;
  const SuccesView(this.onSuccessPress);

  @override
  Widget build(BuildContext context) {
    var _mainCubit = BlocProvider.of<MainCubit>(context);
    return BlocProvider(
      create: (context) => SuccessCubit(_mainCubit),
      child: SuccesContent(onSuccessPress),
    );
  }
}
