import 'package:ecommerce_yildiz_flutter/view/product/price_list/cubit/price_list_cubit.dart';
import 'package:ecommerce_yildiz_flutter/view/product/price_list/model/price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/my_text.dart';
import '../../../../../core/utils/widgets/ui_mixin.dart';

class MyPriceListTable extends StatelessWidget {
  const MyPriceListTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceListCubit, PriceListState>(
      builder: (context, state) {
        var cubit = context.read<PriceListCubit>();
        if (state.data == null) return Center(child: MyText('Liste yok'));
        //var source = state.data!;
        var source = cubit.getDataSource();
        var column = cubit.getDataColumns();
        return PaginatedDataTable(
          header: MyText.headlineMedium('Fiyat Listesi (2)'),
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

class MyPriceListData extends DataTableSource with UIMixin {
  List<Price> data = [];
  List<String> selectedFilters = [];

  MyPriceListData(this.data, this.selectedFilters);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(MyText.titleSmall(data[index].name.toString())),
      DataCell(MyText.titleSmall(data[index].erpConnection.toString())),
      DataCell(MyText.titleSmall(data[index].exchange ?? 'null')),
      DataCell(MyText.titleSmall(data[index].creationDate.toString())),
      DataCell(MyText.titleSmall(data[index].lastUpdateDate.toString())),
      DataCell(
        MyText.titleSmall(
          'Düzenle',
          decoration: TextDecoration.underline,
          color: contentTheme.primary,
        ),
      ),
    ]);

    //);
  }
}
