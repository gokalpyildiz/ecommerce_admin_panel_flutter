import 'package:ecommerce_yildiz_flutter/view/product/product_attributes/model/product_attribute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/my_text.dart';
import '../../../../../core/utils/widgets/ui_mixin.dart';
import '../../cubit/product_attributes_cubit.dart';

class ProductAttributeTable extends StatelessWidget {
  const ProductAttributeTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductAttributesCubit, ProductAttributesState>(
      builder: (context, state) {
        var cubit = context.read<ProductAttributesCubit>();
        if (state.data == null) return Center(child: MyText('Ürün yok'));
        //var source = state.data!;
        var source = cubit.getDataSource();
        var column = cubit.getDataColumns();
        return PaginatedDataTable(
          header: MyText.headlineMedium('Ürün Havuzu (3 Ürün Bulundu)'),
          columns: column,
          source: source,
          columnSpacing: 70,
          horizontalMargin: 28,
          rowsPerPage: 10,
        );
      },
    );
  }
}

class MyProductAttributeData extends DataTableSource with UIMixin {
  List<ProductAttribute> data = [];
  List<String> selectedFilters = [];

  MyProductAttributeData(this.data, this.selectedFilters);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    //return DataRow(cells: generateDataCell(data[index])
    //var url = data[index].images!.first;
    return DataRow(cells: [
      DataCell(MyText.titleSmall(data[index].name.toString())),
      DataCell(MyText.titleSmall(data[index].attributeCode.toString())),
      DataCell(MyText.titleSmall(data[index].listType ?? 'null')),
      DataCell(MyText.titleSmall(data[index].isRequired.toString())),
      DataCell(MyText.titleSmall(data[index].isVisible.toString())),
      DataCell(MyText.titleSmall(data[index].isSearchable.toString())),
      DataCell(MyText.titleSmall(data[index].variant.toString())),
      DataCell(MyText.titleSmall(data[index].isVariableListenable.toString())),
    ]);

    //);
  }
}
