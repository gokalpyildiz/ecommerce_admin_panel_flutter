import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_base_state.dart';

class HomeBaseCubit extends Cubit<HomeBaseState> {
  HomeBaseCubit() : super(HomeBaseInitial());
}
