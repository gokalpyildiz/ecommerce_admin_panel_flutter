import 'package:ecommerce_yildiz_flutter/core/components/basic_widgets/basic_scaffold.dart';
import 'package:ecommerce_yildiz_flutter/core/utils/widgets/ui_mixin.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/layouts/layout.dart';
import 'package:ecommerce_yildiz_flutter/view/product/price_list/cubit/price_list_cubit.dart';
import 'package:ecommerce_yildiz_flutter/view/product/price_list/view/subviews/price_list_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/my_spacing.dart';
import '../../../../product/utility/layouts/responsive.dart';
import 'subviews/price_list_appbar.dart';
import 'subviews/price_list_data.dart';

class PriceListView extends StatelessWidget with UIMixin {
  const PriceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PriceListCubit()..init(),
      child: BasicScaffold(
          child: Layout(
              child: Column(
        children: [
          PriceListAppbar(),
          PriceListFilter(),
          Padding(
            padding: MySpacing.x(flexSpacing),
            child: MyPriceListTable(),
          )
        ],
      ))),
    );
  }
}
