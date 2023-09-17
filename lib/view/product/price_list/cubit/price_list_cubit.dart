import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'price_list_state.dart';

class PriceListCubit extends Cubit<PriceListState> {
  PriceListCubit() : super(PriceListInitial());
}
