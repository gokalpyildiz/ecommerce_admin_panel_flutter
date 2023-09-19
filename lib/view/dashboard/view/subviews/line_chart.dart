import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/utils/widgets/my_card.dart';
import '../../../../core/utils/widgets/my_flex.dart';
import '../../../../core/utils/widgets/my_flex_item.dart';
import '../../../../core/utils/widgets/my_shadow.dart';
import '../../../../core/utils/widgets/my_spacing.dart';
import '../../../../core/utils/widgets/my_text.dart';
import '../../cubit/dashboard_cubit.dart';
import '../../model/chart_data.dart';

class LineChart extends StatelessWidget {
  const LineChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return MyFlex(children: [
          MyFlexItem(
            sizes: "lg-6",
            child: MyCard(
              shadow: MyShadow(elevation: 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyLarge(
                    "Toplam Sipariş Adeti",
                    fontSize: 20,
                    fontWeight: 600,
                  ),
                  MySpacing.height(12),
                  SfCartesianChart(
                    primaryXAxis: NumericAxis(isInversed: true),
                    primaryYAxis: NumericAxis(isInversed: true),
                    tooltipBehavior: state.orderCountTool,
                    series: <ChartSeries<ChartData, double>>[
                      LineSeries<ChartData, double>(
                        dataSource: state.orderCount ?? [],
                        markerSettings: const MarkerSettings(isVisible: true),
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          MyFlexItem(
            sizes: "lg-6",
            child: BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                return MyCard(
                  shadow: MyShadow(elevation: 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.bodyLarge(
                        "Toplam Sipariş Tutarı",
                        fontSize: 20,
                        fontWeight: 600,
                      ),
                      MySpacing.height(12),
                      SfCartesianChart(
                        primaryXAxis: NumericAxis(isInversed: true),
                        primaryYAxis: NumericAxis(isInversed: true),
                        tooltipBehavior: state.orderCountTool,
                        series: <ChartSeries<ChartData, double>>[
                          LineSeries<ChartData, double>(
                            dataSource: state.orderCount ?? [],
                            markerSettings:
                                const MarkerSettings(isVisible: true),
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ]);
      },
    );
  }
}
