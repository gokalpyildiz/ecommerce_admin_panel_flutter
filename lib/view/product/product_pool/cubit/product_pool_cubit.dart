import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_pool_state.dart';

class ProductPoolCubit extends Cubit<ProductPoolState> {
  ProductPoolCubit() : super(ProductPoolInitial());
}
