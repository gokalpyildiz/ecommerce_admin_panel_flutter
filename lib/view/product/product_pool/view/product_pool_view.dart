import 'package:ecommerce_yildiz_flutter/core/components/basic_widgets/basic_scaffold.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/layouts/layout.dart';
import 'package:ecommerce_yildiz_flutter/view/product/product_pool/cubit/product_pool_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/my_spacing.dart';
import '../../../../core/utils/widgets/ui_mixin.dart';
import '../../../../product/utility/layouts/responsive.dart';
import 'subviews/data_table.dart';
import 'subviews/product_appbar.dart';
import 'subviews/product_filters.dart';

class ProductPoolView extends StatelessWidget with UIMixin {
  const ProductPoolView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductPoolCubit()..init(),
      child: BasicScaffold(
          child: Layout(
        child: Column(
          children: [
            ProductAppbar(),
            _productPoolScreen(),
          ],
        ),
      )),
    );
  }

  Column _productPoolScreen() {
    return Column(
      children: [
        ProductFilters(),
        Padding(
          padding: MySpacing.x(flexSpacing),
          child: ProductTable(),
        )
      ],
    );
  }
}
