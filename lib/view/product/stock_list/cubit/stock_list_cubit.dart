import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stock_list_state.dart';

class StockListCubit extends Cubit<StockListState> {
  StockListCubit() : super(StockListInitial());
}
