import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_stock_list_state.dart';

class AddStockListCubit extends Cubit<AddStockListState> {
  AddStockListCubit() : super(AddStockListState());
}
