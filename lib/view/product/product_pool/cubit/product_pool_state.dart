part of 'product_pool_cubit.dart';

sealed class ProductPoolState extends Equatable {
  const ProductPoolState();

  @override
  List<Object> get props => [];
}

final class ProductPoolInitial extends ProductPoolState {}
