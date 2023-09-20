import 'package:bloc/bloc.dart';
import 'package:ecommerce_yildiz_flutter/view/product/product_attributes/model/product_attribute.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/my_text.dart';
import '../view/subviews/my_product_attribute_data.dart';

part 'product_attributes_state.dart';

class ProductAttributesCubit extends Cubit<ProductAttributesState> {
  ProductAttributesCubit() : super(ProductAttributesState());
  void init() {
    var filteredList = [
      'Attribute Name',
      'Attribute Code',
      'List Type',
      'Is Required',
      'Is visible',
      'Searchable',
      'Supplier',
      'Variant'
    ];
    var selectedFilterIndexes = [0, 1, 2, 3, 4, 5, 6, 7];
    var data = getData();
    emit(state.copyWith(
        filterList: filteredList,
        data: MyProductAttributeData(data, filteredList),
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
        data: MyProductAttributeData(getData(), state.filterList ?? [])));
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
    return MyProductAttributeData(getData(), state.filterList ?? []);
  }

  List<ProductAttribute> getData() {
    return <ProductAttribute>[
      ProductAttribute(
        id: 1,
        name: 'İçerik',
        attributeCode: 'A3434',
        listType: 'Text Area',
        isRequired: true,
        isVisible: true,
        isSearchable: true,
        supplier: 'Jaliri',
        variant: true,
      ),
      ProductAttribute(
        id: 1,
        name: 'Marka',
        attributeCode: 'A3034',
        listType: 'Text Area',
        isRequired: true,
        isVisible: true,
        isSearchable: true,
        supplier: 'Kern',
        variant: true,
      ),
      ProductAttribute(
        id: 1,
        name: 'Renk',
        attributeCode: 'A3034',
        listType: 'Text Area',
        isRequired: true,
        isVisible: true,
        isSearchable: true,
        supplier: 'Kaft',
        variant: true,
      ),
      ProductAttribute(
        id: 1,
        name: 'Alt Üst',
        attributeCode: 'A3034',
        listType: 'Text Area',
        isRequired: true,
        isVisible: true,
        isSearchable: true,
        supplier: 'Kaft',
        variant: true,
      ),
    ];
  }
}
