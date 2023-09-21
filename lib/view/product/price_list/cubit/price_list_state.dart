// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'price_list_cubit.dart';

class PriceListState extends Equatable {
  const PriceListState(
      {this.data, this.filterList, this.selectedFilterIndexes});
  final DataTableSource? data;
  final List<String>? filterList;
  final List<int>? selectedFilterIndexes;

  @override
  List<Object?> get props => [data, filterList, selectedFilterIndexes];

  PriceListState copyWith({
    DataTableSource? data,
    List<String>? filterList,
    List<int>? selectedFilterIndexes,
  }) {
    return PriceListState(
      data: data ?? this.data,
      filterList: filterList ?? this.filterList,
      selectedFilterIndexes:
          selectedFilterIndexes ?? this.selectedFilterIndexes,
    );
  }
}
