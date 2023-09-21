// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'jaliri_price_list_cubit.dart';

class JaliriPriceListState extends Equatable {
  const JaliriPriceListState(
      {this.data, this.filterList, this.selectedFilterIndexes});
  final DataTableSource? data;
  final List<String>? filterList;
  final List<int>? selectedFilterIndexes;

  @override
  List<Object?> get props => [data, filterList, selectedFilterIndexes];

  JaliriPriceListState copyWith({
    DataTableSource? data,
    List<String>? filterList,
    List<int>? selectedFilterIndexes,
  }) {
    return JaliriPriceListState(
      data: data ?? this.data,
      filterList: filterList ?? this.filterList,
      selectedFilterIndexes:
          selectedFilterIndexes ?? this.selectedFilterIndexes,
    );
  }
}
