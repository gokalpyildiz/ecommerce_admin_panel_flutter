import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/layouts/layout.dart';
import 'package:flutter/material.dart';

@RoutePage<String>()
class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: const Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
