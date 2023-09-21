import 'package:bloc/bloc.dart';
import 'package:ecommerce_yildiz_flutter/view/product/price_list/model/price.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/my_text.dart';
import '../view/subviews/price_list_data.dart';

part 'price_list_state.dart';

class PriceListCubit extends Cubit<PriceListState> {
  PriceListCubit() : super(PriceListState());
  void init() {
    var filteredList = [
      'Fiyat Listesi',
      'Erp Bağlantısı',
      'İlk Oluşturulma Tarihi',
      'Son Oluşturulma Tarihi',
      'Son Güncellenme Tarihi',
      'İlk Güncellenme Tarihi',
    ];
    var selectedFilterIndexes = [0, 1, 2, 3, 4, 5];
    var data = getData();
    emit(state.copyWith(
        filterList: filteredList,
        data: MyPriceListData(data, filteredList),
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
        data: MyPriceListData(getData(), state.filterList ?? [])));
  }

  List<DataColumn> getDataColumns() {
    // var dataColumns = List<DataColumn>.from(state.selectedFilterIndexes!.map(
    //     (e) =>
    //         DataColumn(label: MyText.titleLarge(state.filterList?[e] ?? ''))));
    // return dataColumns;
    var dataColumns = List<DataColumn>.from(
        state.filterList!.map((e) => DataColumn(label: MyText.titleMedium(e))));
    return dataColumns;
  }

  DataTableSource getDataSource() {
    return MyPriceListData(getData(), state.filterList ?? []);
  }

  List<Price> getData() {
    return <Price>[
      Price(
        id: 1,
        name: 'Liste 1',
        erpConnection: true,
        exchange: 'Tl',
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        firstUpdateDate: DateTime.now(),
      ),
      Price(
        id: 1,
        name: 'Liste 23',
        erpConnection: true,
        exchange: 'Manat',
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        firstUpdateDate: DateTime.now(),
      ),
      Price(
        id: 1,
        name: 'Liste 3',
        erpConnection: true,
        exchange: 'Dolar',
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        firstUpdateDate: DateTime.now(),
      ),
      Price(
        id: 1,
        name: 'Liste 1',
        erpConnection: true,
        exchange: 'Tl',
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        firstUpdateDate: DateTime.now(),
      ),
      Price(
        id: 1,
        name: 'Liste 23',
        erpConnection: true,
        exchange: 'Manat',
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        firstUpdateDate: DateTime.now(),
      ),
      Price(
        id: 1,
        name: 'Liste 3',
        erpConnection: true,
        exchange: 'Dolar',
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        firstUpdateDate: DateTime.now(),
      ),
      Price(
        id: 1,
        name: 'Liste 1',
        erpConnection: true,
        exchange: 'Tl',
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        firstUpdateDate: DateTime.now(),
      ),
      Price(
        id: 1,
        name: 'Liste 23',
        erpConnection: true,
        exchange: 'Manat',
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        firstUpdateDate: DateTime.now(),
      ),
      Price(
        id: 1,
        name: 'Liste 3',
        erpConnection: true,
        exchange: 'Dolar',
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        firstUpdateDate: DateTime.now(),
      ),
      Price(
        id: 1,
        name: 'Liste 1',
        erpConnection: true,
        exchange: 'Tl',
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        firstUpdateDate: DateTime.now(),
      ),
      Price(
        id: 1,
        name: 'Liste 23',
        erpConnection: true,
        exchange: 'Manat',
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        firstUpdateDate: DateTime.now(),
      ),
      Price(
        id: 1,
        name: 'Liste 3',
        erpConnection: true,
        exchange: 'Dolar',
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        firstUpdateDate: DateTime.now(),
      ),
    ];
  }
}
