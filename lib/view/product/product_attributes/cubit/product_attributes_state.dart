part of 'product_attributes_cubit.dart';

sealed class ProductAttributesState extends Equatable {
  const ProductAttributesState();

  @override
  List<Object> get props => [];
}

final class ProductAttributesInitial extends ProductAttributesState {}
