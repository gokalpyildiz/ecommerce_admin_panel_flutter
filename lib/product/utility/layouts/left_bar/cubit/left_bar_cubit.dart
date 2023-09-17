import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'left_bar_state.dart';

class LeftBarCubit extends Cubit<LeftBarState> {
  LeftBarCubit() : super(LeftBarState());
  void setState() {
    emit(LeftBarState());
  }
}
