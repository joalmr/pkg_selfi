import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final GlobalKey<NavigatorState> navigatorKey;
  NavigationCubit(this.navigatorKey) : super(NavigationInitial());

  navigationEvent(route) {
    this
        .navigatorKey
        .currentState!
        .push(MaterialPageRoute(builder: (context) => route));
  }
}
