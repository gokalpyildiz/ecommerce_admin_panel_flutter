import 'package:ecommerce_yildiz_flutter/core/components/basic_widgets/basic_scaffold.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/layouts/layout.dart';
import 'package:ecommerce_yildiz_flutter/view/product/stock_list/cubit/stock_list_cubit.dart';
import 'package:ecommerce_yildiz_flutter/view/product/stock_list/view/subwidgets/stock_list_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/my_spacing.dart';
import '../../../../product/utility/layouts/responsive.dart';
import 'subwidgets/my_stock_list_data.dart';
import 'subwidgets/stok_list_filter.dart';

class StockListView extends StatelessWidget {
  const StockListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StockListCubit()..init(),
      child: BasicScaffold(
          child: Layout(
              child: Column(
        children: [
          StockListAppbar(),
          Padding(
            padding: MySpacing.x(flexSpacing),
            child: StockListFilter(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: MySpacing.x(flexSpacing),
            child: StockListTable(),
          )
        ],
      ))),
    );
  }
}
