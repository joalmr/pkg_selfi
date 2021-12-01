import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'main_cubit.dart';

part 'success_state.dart';

class SuccessCubit extends Cubit<SuccessState> {
  final MainCubit mainCubit;
  SuccessCubit(this.mainCubit) : super(SuccessInitial());
}
