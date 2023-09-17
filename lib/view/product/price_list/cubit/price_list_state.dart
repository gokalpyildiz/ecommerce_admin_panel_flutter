part of 'price_list_cubit.dart';

sealed class PriceListState extends Equatable {
  const PriceListState();

  @override
  List<Object> get props => [];
}

final class PriceListInitial extends PriceListState {}
