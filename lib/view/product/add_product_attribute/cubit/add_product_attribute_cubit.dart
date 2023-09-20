import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_product_attribute_state.dart';

class AddProductAttributeCubit extends Cubit<AddProductAttributeState> {
  AddProductAttributeCubit() : super(AddProductAttributeState());
}
