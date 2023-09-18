import 'package:ecommerce_yildiz_flutter/core/components/basic_widgets/basic_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../product/utility/layouts/layout.dart';

class StockListView extends StatelessWidget {
  const StockListView({super.key});

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
