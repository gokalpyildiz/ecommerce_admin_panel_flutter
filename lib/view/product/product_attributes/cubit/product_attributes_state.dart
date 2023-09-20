// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_attributes_cubit.dart';

class ProductAttributesState extends Equatable {
  const ProductAttributesState(
      {this.data, this.filterList, this.selectedFilterIndexes});
  final DataTableSource? data;
  final List<String>? filterList;
  final List<int>? selectedFilterIndexes;

  @override
  List<Object?> get props => [data, filterList, selectedFilterIndexes];

  ProductAttributesState copyWith({
    DataTableSource? data,
    List<String>? filterList,
    List<int>? selectedFilterIndexes,
  }) {
    return ProductAttributesState(
      data: data ?? this.data,
      filterList: filterList ?? this.filterList,
      selectedFilterIndexes:
          selectedFilterIndexes ?? this.selectedFilterIndexes,
    );
  }
}
