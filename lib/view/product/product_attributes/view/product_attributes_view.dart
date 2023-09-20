import 'package:ecommerce_yildiz_flutter/core/components/basic_widgets/basic_scaffold.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/layouts/layout.dart';
import 'package:ecommerce_yildiz_flutter/view/product/product_attributes/cubit/product_attributes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/my_spacing.dart';
import '../../../../product/utility/layouts/responsive.dart';
import 'subviews/my_product_attribute_data.dart';
import 'subviews/product_attributes_appbar.dart';
import 'subviews/product_attributes_filter.dart';

class ProductAttributesView extends StatelessWidget {
  const ProductAttributesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductAttributesCubit()..init(),
      child: BasicScaffold(
          child: Layout(
              child: Column(
        children: [
          ProductAttributesAppbar(),
          ProductAttributesFilters(),
          Padding(
            padding: MySpacing.x(flexSpacing),
            child: ProductAttributeTable(),
          )
        ],
      ))),
    );
  }
}
