import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/my_text.dart';
import '../../../../../core/utils/widgets/ui_mixin.dart';
import '../../cubit/jaliri_price_list_cubit.dart';
import '../../model/jaliri_price.dart';

class MyJaliriPriceListTable extends StatelessWidget {
  const MyJaliriPriceListTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JaliriPriceListCubit, JaliriPriceListState>(
      builder: (context, state) {
        var cubit = context.read<JaliriPriceListCubit>();
        if (state.data == null) return Center(child: MyText('Liste yok'));
        var source = cubit.getDataSource();
        var column = cubit.getDataColumns();
        return PaginatedDataTable(
          header: MyText.titleLarge('Fiyat Listesi (12 Ürün Bulundu)'),
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

class MyJaliriPriceListData extends DataTableSource with UIMixin {
  List<JaliriPrice> data = [];
  List<String> selectedFilters = [];

  MyJaliriPriceListData(this.data, this.selectedFilters);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    var url = data[index].images?.first ?? '';
    return DataRow(cells: [
      DataCell(
        Image.network(
          url,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return MyText('No image');
          },
        ),
      ),
      DataCell(MyText.titleSmall(data[index].id.toString())),
      DataCell(MyText.titleSmall(data[index].barcode.toString())),
      DataCell(MyText.titleSmall(data[index].baseCode ?? 'null')),
      DataCell(MyText.titleSmall(data[index].productName.toString())),
      DataCell(MyText.titleSmall(data[index].featureSet.toString())),
      DataCell(MyText.titleSmall(data[index].psf.toString())),
      DataCell(MyText.titleSmall(data[index].price.toString())),
      DataCell(MyText.titleSmall(data[index].tax.toString())),
      DataCell(MyText.titleSmall(data[index].currency.toString())),
    ]);

    //);
  }
}
