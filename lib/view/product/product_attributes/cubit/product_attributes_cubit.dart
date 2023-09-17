import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_attributes_state.dart';

class ProductAttributesCubit extends Cubit<ProductAttributesState> {
  ProductAttributesCubit() : super(ProductAttributesInitial());
}
