import 'package:ecommerce_yildiz_flutter/core/utils/widgets/my_flex.dart';
import 'package:ecommerce_yildiz_flutter/core/utils/widgets/my_flex_item.dart';
import 'package:ecommerce_yildiz_flutter/core/utils/widgets/ui_mixin.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/layouts/layout.dart';
import 'package:ecommerce_yildiz_flutter/view/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/widgets/my_button.dart';
import '../../../core/utils/widgets/my_spacing.dart';
import '../../../core/utils/widgets/my_text.dart';
import '../../../product/utility/layouts/responsive.dart';
import 'subviews/line_chart.dart';
import 'subviews/order_chart.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> with UIMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(context),
      child: Layout(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
            child: _top(),
          ),
          Divider(),
          MyFlex(
            children: [
              MyFlexItem(sizes: "lg-6", child: _statistics()),
              //MyFlexItem(sizes: "lg-6", child: Text('sdafds'))
              MyFlexItem(
                sizes: "lg-6",
                child: Padding(
                  padding: MySpacing.x(flexSpacing / 2),
                  child: CircleOrderChart(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          LineChart(),
        ],
      )),
    );
  }

  Column _statistics() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _box('Toplam Satış', 'Toplam Satış Tutarı'),
            MySpacing.width(30),
            _box('Toplam Sipariş', '1243')
          ],
        ),
        MySpacing.height(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _box('Toplam Satış', 'Toplam Satış Tutarı'),
            MySpacing.width(30),
            _box('Toplam Sipariş', '1243')
          ],
        ),
      ],
    );
  }

  Widget _box(String title, String value) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [MyText(title), MyText(value)],
      ),
    );
  }

  Container _top() {
    return Container(
      //color: Colors.grey[200],
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText.titleLarge(
                      "E-commerce",
                    ),
                    MyText(
                      'Dashboard',
                    ),
                  ],
                ),
              ),
            ],
          ),
          _dateRangeButton(),
        ],
      ),
    );
  }

  Widget _dateRangeButton() {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        var cubit = context.read<DashboardCubit>();
        return MyButton.outlined(
          onPressed: () {
            cubit.pickDateRange();
          },
          borderColor: contentTheme.primary,
          padding: MySpacing.xy(16, 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.calendar_month_outlined,
                color: contentTheme.primary,
                size: 16,
              ),
              MySpacing.width(10),
              MyText.labelMedium(
                  cubit.getStartDate() != null && cubit.getEndDate() != null
                      ? (cubit.getStartDate()! + ' ' + cubit.getEndDate()!)
                      : "Select Range",
                  fontWeight: 600,
                  color: contentTheme.primary),
            ],
          ),
        );
      },
    );
  }
}
