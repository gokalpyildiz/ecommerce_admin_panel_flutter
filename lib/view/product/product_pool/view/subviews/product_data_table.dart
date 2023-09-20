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
        //var source = state.data!;
        var source = cubit.getDataSource();
        var column = cubit.getDataColumns();
        return PaginatedDataTable(
          header: MyText.headlineMedium('Ürün Havuzu (3 Ürün Bulundu)'),
          columns: column,
          source: source,
          columnSpacing: 110,
          horizontalMargin: 28,
          rowsPerPage: 10,
        );
      },
    );
  }
}

class MyProductData extends DataTableSource with UIMixin {
  List<Product> data = [];
  List<String> selectedFilters = [];

  MyProductData(this.data, this.selectedFilters);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    //return DataRow(cells: generateDataCell(data[index])
    var url = data[index].images!.first;
    return DataRow(cells: [
      //if (selectedFilters.contains('Fotoğraflar'))
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
      DataCell(MyText.titleSmall(data[index].barcode.toString())),
      //if (selectedFilters.contains('Base Kod'))
      DataCell(MyText.titleSmall(data[index].baseCode.toString())),
      //if (selectedFilters.contains('Ürün Adı'))
      DataCell(MyText.titleSmall(data[index].name ?? 'null')),
      //if (selectedFilters.contains('Özellik Seti'))
      DataCell(
          MyText.titleSmall(data[index].productFeature?.featureName ?? 'null')),
      //if (selectedFilters.contains('Durum'))
      DataCell(MyText.titleSmall((data[index].state ?? '-').toString())),
    ]);

    //);
  }

  List<DataCell> generateDataCell(Product product) {
    var url = product.images!.first;
    var data = [
      //if (selectedFilters.contains('Fotoğraflar'))
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
      DataCell(MyText.titleMedium(product.barcode.toString())),
      //if (selectedFilters.contains('Base Kod'))
      DataCell(MyText.titleMedium(product.baseCode.toString())),
      //if (selectedFilters.contains('Ürün Adı'))
      DataCell(MyText.titleMedium(product.name ?? 'null')),
      //if (selectedFilters.contains('Özellik Seti'))
      DataCell(
          MyText.titleMedium(product.productFeature?.featureName ?? 'null')),
      //if (selectedFilters.contains('Durum'))
      DataCell(MyText.titleMedium((product.state ?? '-').toString())),
    ];
    return data;
  }
}
