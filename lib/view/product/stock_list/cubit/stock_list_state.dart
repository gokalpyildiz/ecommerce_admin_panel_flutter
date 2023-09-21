part of 'stock_list_cubit.dart';

class StockListState extends Equatable {
  const StockListState(
      {this.data, this.filterList, this.selectedFilterIndexes});
  final DataTableSource? data;
  final List<String>? filterList;
  final List<int>? selectedFilterIndexes;

  @override
  List<Object?> get props => [data, filterList, selectedFilterIndexes];

  StockListState copyWith({
    DataTableSource? data,
    List<String>? filterList,
    List<int>? selectedFilterIndexes,
  }) {
    return StockListState(
      data: data ?? this.data,
      filterList: filterList ?? this.filterList,
      selectedFilterIndexes:
          selectedFilterIndexes ?? this.selectedFilterIndexes,
    );
  }
}
