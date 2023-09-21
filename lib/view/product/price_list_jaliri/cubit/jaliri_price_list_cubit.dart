import 'package:bloc/bloc.dart';
import 'package:ecommerce_yildiz_flutter/view/product/price_list_jaliri/model/jaliri_price.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/utils/widgets/my_text.dart';
import '../../price_list/view/subviews/price_list_data.dart';
import '../view/subviews/my_jaliri_pricelist_table.dart';

part 'jaliri_price_list_state.dart';

class JaliriPriceListCubit extends Cubit<JaliriPriceListState> {
  JaliriPriceListCubit() : super(JaliriPriceListState());
  void init() {
    var filteredList = [
      'Photo',
      'Özellik Seti',
      'Psf',
      'Vergi',
      'Para Birimi',
      'SKU',
      'Max Satış Fiyatı',
      'Base Code',
      'Son Güncellenme Tarihi',
      'Ürünün Adı',
    ];
    var selectedFilterIndexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    var data = getData();
    emit(state.copyWith(
        filterList: filteredList,
        data: MyJaliriPriceListData(data, filteredList),
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
        data: MyJaliriPriceListData(getData(), state.filterList ?? [])));
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
      DataColumn(label: MyText.titleMedium('ID')),
      DataColumn(label: MyText.titleMedium('SKU')),
      DataColumn(label: MyText.titleMedium('Base Code')),
      DataColumn(label: MyText.titleMedium('Ürünün Adı')),
      DataColumn(label: MyText.titleMedium('Özellik Seti')),
      DataColumn(label: MyText.titleMedium('PSF')),
      DataColumn(label: MyText.titleMedium('Satış Fiyatı')),
      DataColumn(label: MyText.titleMedium('Vergi')),
      DataColumn(label: MyText.titleMedium('Para Birimi')),
    ];
    return dataColumns;
  }

  DataTableSource getDataSource() {
    return MyJaliriPriceListData(getData(), state.filterList ?? []);
  }

  List<JaliriPrice> getData() {
    return <JaliriPrice>[
      JaliriPrice(
        id: 1,
        barcode: '86934343433',
        baseCode: '86934343433',
        productName: 'Ürün 1',
        featureSet: 'Özellik Seti 1',
        psf: 799.99,
        price: 49.99,
        tax: 18,
        currency: 'Tl',
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      JaliriPrice(
        id: 3,
        barcode: '86934343434',
        baseCode: '86934343443',
        productName: 'Ürün 13',
        featureSet: 'Özellik Seti 12',
        psf: 599.99,
        price: 149.99,
        tax: 185,
        currency: 'Manat',
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      JaliriPrice(
        id: 1,
        barcode: '86934343433',
        baseCode: '86934343433',
        productName: 'Ürün 1',
        featureSet: 'Özellik Seti 1',
        psf: 799.99,
        price: 49.99,
        tax: 18,
        currency: 'Tl',
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      JaliriPrice(
        id: 3,
        barcode: '86934343434',
        baseCode: '86934343443',
        productName: 'Ürün 13',
        featureSet: 'Özellik Seti 12',
        psf: 599.99,
        price: 149.99,
        tax: 185,
        currency: 'Manat',
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      JaliriPrice(
        id: 1,
        barcode: '86934343433',
        baseCode: '86934343433',
        productName: 'Ürün 1',
        featureSet: 'Özellik Seti 1',
        psf: 799.99,
        price: 49.99,
        tax: 18,
        currency: 'Tl',
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      JaliriPrice(
        id: 3,
        barcode: '86934343434',
        baseCode: '86934343443',
        productName: 'Ürün 13',
        featureSet: 'Özellik Seti 12',
        psf: 599.99,
        price: 149.99,
        tax: 185,
        currency: 'Manat',
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      JaliriPrice(
        id: 1,
        barcode: '86934343433',
        baseCode: '86934343433',
        productName: 'Ürün 1',
        featureSet: 'Özellik Seti 1',
        psf: 799.99,
        price: 49.99,
        tax: 18,
        currency: 'Tl',
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      JaliriPrice(
        id: 3,
        barcode: '86934343434',
        baseCode: '86934343443',
        productName: 'Ürün 13',
        featureSet: 'Özellik Seti 12',
        psf: 599.99,
        price: 149.99,
        tax: 185,
        currency: 'Manat',
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      JaliriPrice(
        id: 1,
        barcode: '86934343433',
        baseCode: '86934343433',
        productName: 'Ürün 1',
        featureSet: 'Özellik Seti 1',
        psf: 799.99,
        price: 49.99,
        tax: 18,
        currency: 'Tl',
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      JaliriPrice(
        id: 3,
        barcode: '86934343434',
        baseCode: '86934343443',
        productName: 'Ürün 13',
        featureSet: 'Özellik Seti 12',
        psf: 599.99,
        price: 149.99,
        tax: 185,
        currency: 'Manat',
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      JaliriPrice(
        id: 1,
        barcode: '86934343433',
        baseCode: '86934343433',
        productName: 'Ürün 1',
        featureSet: 'Özellik Seti 1',
        psf: 799.99,
        price: 49.99,
        tax: 18,
        currency: 'Tl',
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
      JaliriPrice(
        id: 3,
        barcode: '86934343434',
        baseCode: '86934343443',
        productName: 'Ürün 13',
        featureSet: 'Özellik Seti 12',
        psf: 599.99,
        price: 149.99,
        tax: 185,
        currency: 'Manat',
        images: ['https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'],
      ),
    ];
  }
}
