import 'package:ecommerce_yildiz_flutter/core/extensions/widget_extension.dart';
import 'package:ecommerce_yildiz_flutter/view/product/stock_list/cubit/stock_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/my_text.dart';
import '../../../../../core/utils/widgets/ui_mixin.dart';
import '../../model/stock.dart';

class StockListTable extends StatelessWidget {
  const StockListTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockListCubit, StockListState>(
      builder: (context, state) {
        var cubit = context.read<StockListCubit>();
        if (state.data == null) return Center(child: MyText('Data yok'));
        //var source = state.data!;
        var source = cubit.getDataSource();
        var column = cubit.getDataColumns();
        return PaginatedDataTable(
          header: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              MyText.titleMedium('Stok Listesi'),
              MyText.titleSmall(
                  'Satışa sunmak istediğiniz ürünler için stok listesi tanımlayabilir ve değişiklik yapabilirsiniz')
            ],
          ),
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

class MyStockData extends DataTableSource with UIMixin {
  List<Stock> data = [];
  List<String> selectedFilters = [];

  MyStockData(this.data, this.selectedFilters);

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
      DataCell(MyText.titleSmall(data[index].stockState.toString())),
      DataCell(MyText.titleSmall(data[index].stockAmount.toString())),
      DataCell(
          MyText.titleSmall((data[index].maxStockQuantitiy ?? '-').toString())),
      DataCell(
          MyText.titleSmall((data[index].minStockQuantity ?? '-').toString())),
      DataCell(MyText.titleSmall((data[index].unitPrice ?? '-').toString())),
      DataCell(MyText.titleSmall(data[index].stockUpdateDate.toString())),
      DataCell(MyText.titleSmall(data[index].stockState.toString())),
    ]);

    //);
  }
}
