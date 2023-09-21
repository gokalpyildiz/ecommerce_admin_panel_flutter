import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_price_state.dart';

class AddPriceListCubit extends Cubit<AddPriceListState> {
  AddPriceListCubit() : super(AddPriceListState());
}
