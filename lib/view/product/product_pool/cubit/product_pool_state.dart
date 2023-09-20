// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_pool_cubit.dart';

class ProductPoolState extends Equatable {
  const ProductPoolState({
    this.data,
    this.filterList,
    this.selectedFilterIndexes,
  });
  final DataTableSource? data;
  final List<String>? filterList;
  final List<int>? selectedFilterIndexes;

  @override
  List<Object?> get props => [data, filterList, selectedFilterIndexes];

  ProductPoolState copyWith({
    DataTableSource? data,
    List<String>? filterList,
    List<int>? selectedFilterIndexes,
  }) {
    return ProductPoolState(
      data: data ?? this.data,
      filterList: filterList ?? this.filterList,
      selectedFilterIndexes:
          selectedFilterIndexes ?? this.selectedFilterIndexes,
    );
  }
}
