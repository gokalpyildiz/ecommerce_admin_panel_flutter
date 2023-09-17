part of 'stock_list_cubit.dart';

sealed class StockListState extends Equatable {
  const StockListState();

  @override
  List<Object> get props => [];
}

final class StockListInitial extends StockListState {}
