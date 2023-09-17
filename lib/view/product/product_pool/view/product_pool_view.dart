import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_yildiz_flutter/core/components/basic_widgets/basic_scaffold.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/layouts/layout.dart';
import 'package:flutter/material.dart';

@RoutePage<String>()
class ProductPoolView extends StatelessWidget {
  const ProductPoolView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
        child: Layout(
      child: const Center(
        child: Text('Product Pool'),
      ),
    ));
  }
}