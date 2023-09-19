import 'package:ecommerce_yildiz_flutter/core/utils/widgets/my_flex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/utils/widgets/my_card.dart';
import '../../../../core/utils/widgets/my_flex_item.dart';
import '../../../../core/utils/widgets/my_shadow.dart';
import '../../../../core/utils/widgets/my_text.dart';
import '../../cubit/dashboard_cubit.dart';
import '../../model/chart_data.dart';

class CircleOrderChart extends StatelessWidget {
  const CircleOrderChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return MyCard(
          shadow: MyShadow(elevation: 0.5),
          child: MyFlex(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyFlexItem(
                child: MyText.titleLarge(
                  "Order Total",
                ),
              ),
              MyFlexItem(
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      child: SfCircularChart(
                          // legend: Legend(
                          //     isVisible: true, position: LegendPosition.bottom),
                          series: [
                            PieSeries<ChartData1, String>(
                                dataSource: state.chartTotalOrder,
                                pointColorMapper: (ChartData1 data, _) =>
                                    data.color,
                                xValueMapper: (ChartData1 data, _) => data.x,
                                yValueMapper: (ChartData1 data, _) => data.y,
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: true)),
                          ]),
                    ),
                    MyFlexItem(
                      child: SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                _circle(Colors.orange),
                                MyText.bodyMedium('Tamamlanan Siparişler')
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                _circle(Colors.green),
                                MyText.bodyMedium('İptal Edilenler')
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                _circle(Colors.yellow),
                                MyText.bodyMedium('İade Edilenler')
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _circle(Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
