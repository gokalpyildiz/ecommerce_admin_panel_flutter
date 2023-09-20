// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_pool_cubit.dart';

enum OnWhichProductPage { PPODUCT_POOL, ADD_PRODUCT }

class ProductPoolState extends Equatable {
  const ProductPoolState({
    this.data,
    this.filterList,
    this.selectedFilterIndexes,
    this.onWhichProductPage = OnWhichProductPage.PPODUCT_POOL,
  });
  final DataTableSource? data;
  final List<String>? filterList;
  final List<int>? selectedFilterIndexes;
  final OnWhichProductPage onWhichProductPage;

  @override
  List<Object?> get props =>
      [data, filterList, selectedFilterIndexes, onWhichProductPage];

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
