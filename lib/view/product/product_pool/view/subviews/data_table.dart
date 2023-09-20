import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/my_text.dart';
import '../../../../../core/utils/widgets/ui_mixin.dart';
import '../../cubit/product_pool_cubit.dart';
import '../../model/product.dart';

class ProductTable extends StatelessWidget {
  const ProductTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductPoolCubit, ProductPoolState>(
      builder: (context, state) {
        var cubit = context.read<ProductPoolCubit>();
        if (state.data == null) return Center(child: MyText('Ürün yok'));
        return PaginatedDataTable(
          header: MyText.headlineLarge('Ürün Havuzu'),
          columns: cubit.getDataColumns(),
          source: state.data!,
          columnSpacing: 110,
          horizontalMargin: 28,
          rowsPerPage: 10,
        );
      },
    );
  }
}

class MyData extends DataTableSource with UIMixin {
  List<Product> data = [];
  List<String> selectedFilters = [];

  MyData(this.data, this.selectedFilters);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    var url = data[index].images!.first;
    return DataRow(
      cells: [
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
        //if (selectedFilters.contains('Sku'))
        DataCell(MyText.titleMedium(data[index].barcode.toString())),
        DataCell(MyText.titleMedium(data[index].baseCode.toString())),
        DataCell(MyText.titleMedium(data[index].name ?? 'null')),
        DataCell(MyText.titleMedium(
            data[index].productFeature?.featureName ?? 'null')),
        DataCell(MyText.titleMedium((data[index].state ?? '-').toString())),
      ],
    );
  }
}
