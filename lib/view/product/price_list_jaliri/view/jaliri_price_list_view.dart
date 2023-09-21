import 'package:ecommerce_yildiz_flutter/core/components/basic_widgets/basic_scaffold.dart';
import 'package:ecommerce_yildiz_flutter/core/utils/widgets/ui_mixin.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/my_spacing.dart';
import '../../../../product/utility/layouts/responsive.dart';
import '../cubit/jaliri_price_list_cubit.dart';
import 'subwidgets/jaliri_price_list_appbar.dart';
import 'subwidgets/jaliri_price_list_filter.dart';
import 'subwidgets/my_jaliri_pricelist_table.dart';

class JaliriPriceListView extends StatelessWidget with UIMixin {
  const JaliriPriceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JaliriPriceListCubit()..init(),
      child: BasicScaffold(
          child: Layout(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JaliriPriceListAppbar(),
          Padding(
            padding: MySpacing.x(flexSpacing),
            child: JaliriPriceListFilter(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: MySpacing.x(flexSpacing),
            child: MyJaliriPriceListTable(),
          )
        ],
      ))),
    );
  }
}
