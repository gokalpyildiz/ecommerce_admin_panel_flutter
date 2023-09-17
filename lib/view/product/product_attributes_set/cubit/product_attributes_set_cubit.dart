import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_attributes_set_state.dart';

class ProductAttributesSetCubit extends Cubit<ProductAttributesSetState> {
  ProductAttributesSetCubit() : super(ProductAttributesSetInitial());
}
