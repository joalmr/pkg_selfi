import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkg_selfi/src/domains/cubit/main_cubit.dart';
import 'package:pkg_selfi/src/domains/cubit/navigation/navigation_cubit.dart';
import 'package:pkg_selfi/src/widgets/error/error-msg.dart';

import 'success/success.dart';
import 'take-picture/take-picture.dart';
import 'welcome/welcome.dart';

class MainPkgView extends StatefulWidget {
  final String token;
  final String trackingId;
  final void Function() onSuccessPress;
  final void Function() errorAndExit;

  const MainPkgView({
    required this.token,
    required this.trackingId,
    required this.onSuccessPress,
    required this.errorAndExit,
  });

  @override
  State<MainPkgView> createState() => _MainPkgViewState();
}

class _MainPkgViewState extends State<MainPkgView> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    var navigatorCubit = NavigationCubit(navigatorKey);
    var mainCubit = MainCubit(navigatorCubit);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => navigatorCubit),
        BlocProvider(create: (context) => mainCubit),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        home: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
            if (state is MainError) {
              navigatorCubit.navigationEvent(ErrorMsg(
                errorCode: state.code,
                errorUserMessage: state.userMessage,
                onErrorPress: widget.errorAndExit,
              ));
            }
            if (state is MainTakePicture) {
              navigatorCubit.navigationEvent(TakePictureView());
            }
            if (state is MainSuccess) {
              navigatorCubit.navigationEvent(SuccesView(widget.onSuccessPress));
            }
            if (state is MainFail) {
              //error selfie
              // final snackBar = SnackBar(content: Text(state.msg));
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            return WelcomeView(
              token: widget.token,
              trackingId: widget.trackingId,
            );
          },
        ),
      ),
    );
  }
}
