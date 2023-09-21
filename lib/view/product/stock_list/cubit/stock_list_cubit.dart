import 'package:bloc/bloc.dart';
import 'package:ecommerce_yildiz_flutter/view/product/stock_list/view/subwidgets/my_stock_list_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/utils/widgets/my_text.dart';
import '../model/stock.dart';

part 'stock_list_state.dart';

class StockListCubit extends Cubit<StockListState> {
  StockListCubit() : super(StockListState());
  void init() {
    var filteredList = [
      'Stok Listesi',
      'Maksimum Stok Miktarı',
      'Minimum Stok Miktarı',
      'Stok Güncelleme Tarihi',
      'Stok Durumu',
      'Toplam Stok Değeri',
    ];
    var selectedFilterIndexes = [0, 1, 2, 3, 4, 5];
    var data = getData();
    emit(state.copyWith(
        filterList: filteredList,
        data: MyStockData(data, filteredList),
        selectedFilterIndexes: selectedFilterIndexes));
  }

  void setSelectedFilterIndexes(List<int> selectedFilterIndexes) {
    var filteredList = state.filterList ?? [];
    var newList = <String>[];

    for (var i = 0; i < filteredList.length; i++) {
      newList.add(filteredList[i]);
    }
    emit(state.copyWith(
        selectedFilterIndexes: selectedFilterIndexes,
        //data: MyData(getData(), newList)));
        data: MyStockData(getData(), state.filterList ?? [])));
  }

  List<DataColumn> getDataColumns() {
    // var dataColumns = List<DataColumn>.from(state.selectedFilterIndexes!.map(
    //     (e) =>
    //         DataColumn(label: MyText.titleLarge(state.filterList?[e] ?? ''))));
    // return dataColumns;
    // var dataColumns = List<DataColumn>.from(
    //     state.filterList!.map((e) => DataColumn(label: MyText.titleMedium(e))));
    var dataColumns = <DataColumn>[
      DataColumn(label: Icon(LucideIcons.image)),
      DataColumn(label: MyText.titleMedium('Stok Miktarı')),
      DataColumn(label: MyText.titleMedium('Maksimum Stok Miktarı')),
      DataColumn(label: MyText.titleMedium('Minimum Stok Miktarı')),
      DataColumn(label: MyText.titleMedium('Birim Fiyatı')),
      DataColumn(label: MyText.titleMedium('Stok Güncelleme Tarihi')),
      DataColumn(label: MyText.titleMedium('Stok Durumu')),
    ];
    return dataColumns;
  }

  DataTableSource getDataSource() {
    return MyStockData(getData(), state.filterList ?? []);
  }

  List<Stock> getData() {
    return <Stock>[
      Stock(
        id: 1,
        stockAmount: 450,
        maxStockQuantitiy: 140,
        minStockQuantity: 10,
        stockUpdateDate: DateTime.now(),
        unitPrice: 350,
        stockState: 300,
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      Stock(
        id: 3,
        stockAmount: 230,
        maxStockQuantitiy: 120,
        minStockQuantity: 30,
        stockUpdateDate: DateTime.now(),
        unitPrice: 450,
        stockState: 900,
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      Stock(
        id: 1,
        stockAmount: 450,
        maxStockQuantitiy: 140,
        minStockQuantity: 10,
        stockUpdateDate: DateTime.now(),
        unitPrice: 350,
        stockState: 300,
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      Stock(
        id: 3,
        stockAmount: 230,
        maxStockQuantitiy: 120,
        minStockQuantity: 30,
        stockUpdateDate: DateTime.now(),
        unitPrice: 450,
        stockState: 900,
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      Stock(
        id: 1,
        stockAmount: 450,
        maxStockQuantitiy: 140,
        minStockQuantity: 10,
        stockUpdateDate: DateTime.now(),
        unitPrice: 350,
        stockState: 300,
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      Stock(
        id: 3,
        stockAmount: 230,
        maxStockQuantitiy: 120,
        minStockQuantity: 30,
        stockUpdateDate: DateTime.now(),
        unitPrice: 450,
        stockState: 900,
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      Stock(
        id: 1,
        stockAmount: 450,
        maxStockQuantitiy: 140,
        minStockQuantity: 10,
        stockUpdateDate: DateTime.now(),
        unitPrice: 350,
        stockState: 300,
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      Stock(
        id: 3,
        stockAmount: 230,
        maxStockQuantitiy: 120,
        minStockQuantity: 30,
        stockUpdateDate: DateTime.now(),
        unitPrice: 450,
        stockState: 900,
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      Stock(
        id: 1,
        stockAmount: 450,
        maxStockQuantitiy: 140,
        minStockQuantity: 10,
        stockUpdateDate: DateTime.now(),
        unitPrice: 350,
        stockState: 300,
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      Stock(
        id: 3,
        stockAmount: 230,
        maxStockQuantitiy: 120,
        minStockQuantity: 30,
        stockUpdateDate: DateTime.now(),
        unitPrice: 450,
        stockState: 900,
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      Stock(
        id: 1,
        stockAmount: 450,
        maxStockQuantitiy: 140,
        minStockQuantity: 10,
        stockUpdateDate: DateTime.now(),
        unitPrice: 350,
        stockState: 300,
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      Stock(
        id: 3,
        stockAmount: 230,
        maxStockQuantitiy: 120,
        minStockQuantity: 30,
        stockUpdateDate: DateTime.now(),
        unitPrice: 450,
        stockState: 900,
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
    ];
  }
}
