import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState()) {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      _changeFirstInit();
    });
  }
  void _changeFirstInit() {
    emit(state.copyWith(isFirstInit: !state.isFirstInit));
  }
}
