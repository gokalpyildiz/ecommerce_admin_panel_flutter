import 'package:bloc/bloc.dart';
import 'package:ecommerce_yildiz_flutter/core/utils/widgets/my_text.dart';
import 'package:ecommerce_yildiz_flutter/view/product/product_pool/model/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../view/subviews/product_data_table.dart';

part 'product_pool_state.dart';

class ProductPoolCubit extends Cubit<ProductPoolState> {
  ProductPoolCubit() : super(ProductPoolState());

  void init() {
    var filteredList = [
      'Fotoğraflar',
      'Sku',
      'Base Kod',
      'Ürün Adı',
      'Özellik Seti',
      'Durum'
    ];
    var selectedFilterIndexes = [0, 1, 2, 3, 4, 5];
    var data = getData();
    emit(state.copyWith(
        filterList: filteredList,
        data: MyProductData(data, filteredList),
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
        data: MyProductData(getData(), state.filterList ?? [])));
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
    return MyProductData(getData(), state.filterList ?? []);
  }

  List<Product> getData() {
    return <Product>[
      Product(
          id: 23,
          name: 'Jecki Denim',
          productFeature: ProductFeature(id: 4, featureName: 'Dress'),
          price: 229,
          ordersCount: 67,
          barcode: '44522716',
          stock: 10,
          baseCode: 'AF4345',
          state: true,
          images: [
            'https://www.allsaints.com/dw/image/v2/BHHD_PRD/on/demandware.static/-/Sites-allsaints-us-master-catalog/default/dwcefbc63d/images/large/WD031Z/156/WD031Z-156-1.jpg?sw=3000&sh=3000&sm=fit&q=70'
          ]),
      Product(
          id: 4,
          name: 'Ester',
          productFeature: ProductFeature(id: 2, featureName: 'Dress'),
          price: 10,
          ordersCount: 40,
          barcode: '48522718',
          stock: 10,
          baseCode: 'AF4389',
          state: true,
          images: [
            'https://cdn.galialahav.com/app/uploads/2022/11/galia_lahav_16_11176730.jpg'
          ]),
      Product(
          id: 1,
          name: 'Carrie',
          productFeature: ProductFeature(id: 1, featureName: 'Bridal gown'),
          price: 100,
          ordersCount: 4,
          barcode: '48572718',
          stock: 10,
          baseCode: 'AF4321',
          state: true,
          images: [
            'https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'
          ]),
      Product(
          id: 23,
          name: 'Jecki Denim',
          productFeature: ProductFeature(id: 4, featureName: 'Dress'),
          price: 229,
          ordersCount: 67,
          barcode: '44522716',
          stock: 10,
          baseCode: 'AF4345',
          state: true,
          images: [
            'https://www.allsaints.com/dw/image/v2/BHHD_PRD/on/demandware.static/-/Sites-allsaints-us-master-catalog/default/dwcefbc63d/images/large/WD031Z/156/WD031Z-156-1.jpg?sw=3000&sh=3000&sm=fit&q=70'
          ]),
      Product(
          id: 4,
          name: 'Ester',
          productFeature: ProductFeature(id: 2, featureName: 'Dress'),
          price: 10,
          ordersCount: 40,
          barcode: '48522718',
          stock: 10,
          baseCode: 'AF4389',
          state: true,
          images: [
            'https://cdn.galialahav.com/app/uploads/2022/11/galia_lahav_16_11176730.jpg'
          ]),
      Product(
          id: 1,
          name: 'Carrie',
          productFeature: ProductFeature(id: 1, featureName: 'Bridal gown'),
          price: 100,
          ordersCount: 4,
          barcode: '48572718',
          stock: 10,
          baseCode: 'AF4321',
          state: true,
          images: [
            'https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'
          ]),
      Product(
          id: 23,
          name: 'Jecki Denim',
          productFeature: ProductFeature(id: 4, featureName: 'Dress'),
          price: 229,
          ordersCount: 67,
          barcode: '44522716',
          stock: 10,
          baseCode: 'AF4345',
          state: true,
          images: [
            'https://www.allsaints.com/dw/image/v2/BHHD_PRD/on/demandware.static/-/Sites-allsaints-us-master-catalog/default/dwcefbc63d/images/large/WD031Z/156/WD031Z-156-1.jpg?sw=3000&sh=3000&sm=fit&q=70'
          ]),
      Product(
          id: 4,
          name: 'Ester',
          productFeature: ProductFeature(id: 2, featureName: 'Dress'),
          price: 10,
          ordersCount: 40,
          barcode: '48522718',
          stock: 10,
          baseCode: 'AF4389',
          state: true,
          images: [
            'https://cdn.galialahav.com/app/uploads/2022/11/galia_lahav_16_11176730.jpg'
          ]),
      Product(
          id: 1,
          name: 'Carrie',
          productFeature: ProductFeature(id: 1, featureName: 'Bridal gown'),
          price: 100,
          ordersCount: 4,
          barcode: '48572718',
          stock: 10,
          baseCode: 'AF4321',
          state: true,
          images: [
            'https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'
          ]),
      Product(
          id: 23,
          name: 'Jecki Denim',
          productFeature: ProductFeature(id: 4, featureName: 'Dress'),
          price: 229,
          ordersCount: 67,
          barcode: '44522716',
          stock: 10,
          baseCode: 'AF4345',
          state: true,
          images: [
            'https://www.allsaints.com/dw/image/v2/BHHD_PRD/on/demandware.static/-/Sites-allsaints-us-master-catalog/default/dwcefbc63d/images/large/WD031Z/156/WD031Z-156-1.jpg?sw=3000&sh=3000&sm=fit&q=70'
          ]),
      Product(
          id: 4,
          name: 'Ester',
          productFeature: ProductFeature(id: 2, featureName: 'Dress'),
          price: 10,
          ordersCount: 40,
          barcode: '48522718',
          stock: 10,
          baseCode: 'AF4389',
          state: true,
          images: [
            'https://cdn.galialahav.com/app/uploads/2022/11/galia_lahav_16_11176730.jpg'
          ]),
      Product(
          id: 1,
          name: 'Carrie',
          productFeature: ProductFeature(id: 1, featureName: 'Bridal gown'),
          price: 100,
          ordersCount: 4,
          barcode: '48572718',
          stock: 10,
          baseCode: 'AF4321',
          state: true,
          images: [
            'https://cdn.galialahav.com/app/uploads/2023/04/Carrie-F.jpg'
          ]),
    ];
  }
}
