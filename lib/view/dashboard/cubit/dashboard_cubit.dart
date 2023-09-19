import 'package:bloc/bloc.dart';
import 'package:ecommerce_yildiz_flutter/product/constants/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_data.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this.context) : super(DashboardState()) {
    init();
  }
  BuildContext context;
  final dateFormatter = AppConstants.dateFormatter;

  void init() {
    var end = DateTime.now();
    var start = end.subtract(const Duration(days: 30));
    var range = DateTimeRange(start: start, end: end);
    final List<ChartData1> chartTotalOrder = [
      ChartData1('Tamamlanan Sipariş', 25, Colors.orange),
      ChartData1('İptal Edilenler', 38, Colors.green),
      ChartData1('İade Edilenler', 34, Colors.yellow),
    ];

    final List<ChartData> orderCount = <ChartData>[
      ChartData(2010, 10.53),
      ChartData(2011, 9.5),
      ChartData(2012, 10),
      ChartData(2013, 2.4),
      ChartData(2014, 5.8),
      ChartData(2015, 1.9),
      ChartData(2016, 15.5),
      ChartData(2017, 3.6),
      ChartData(2018, 8.43),
      ChartData(2019, 5.68),
      ChartData(2020, 7.15),
      ChartData(2021, 15.26),
      ChartData(2022, 10.89),
    ];
    final List<ChartData> orderAmount = <ChartData>[
      ChartData(2010, 10.53),
      ChartData(2011, 9.5),
      ChartData(2012, 10),
      ChartData(2013, 2.4),
      ChartData(2014, 5.8),
      ChartData(2015, 1.9),
      ChartData(2016, 15.5),
      ChartData(2017, 3.6),
      ChartData(2018, 8.43),
      ChartData(2019, 5.68),
      ChartData(2020, 7.15),
      ChartData(2021, 15.26),
      ChartData(2022, 10.89),
    ];
    // final List<ChartData2> chartData2 = [
    //   ChartData2(2012, 12, 10),
    //   ChartData2(2013, 14, 11),
    //   ChartData2(2014, 16, 10),
    //   ChartData2(2015, 20, 25),
    //   ChartData2(2016, 22, 10),
    //   ChartData2(2017, 24, 12),
    //   ChartData2(2018, 26, 16),
    // ];
    var chartDataTool = TooltipBehavior(
      enable: true,
    );
    var orderAmountTool = TooltipBehavior(
      enable: true,
      format: 'point.x : point.y',
    );
    var orderCountTool = TooltipBehavior(
      enable: true,
      format: 'point.x : point.y',
    );
    emit(state.copyWith(
        selectedDateTimeRange: range,
        chartTotalOrder: chartTotalOrder,
        orderAmount: orderAmount,
        orderCount: orderCount,
        //chartData2: chartData2,
        chartDataTool: chartDataTool,
        orderAmountTool: orderAmountTool,
        orderCountTool: orderCountTool));
  }

  String? getStartDate() {
    if (state.selectedDateTimeRange == null) return null;
    return dateFormatter.format(state.selectedDateTimeRange!.start);
  }

  String? getEndDate() {
    if (state.selectedDateTimeRange == null)
      return dateFormatter.format(DateTime.now());
    return dateFormatter.format(state.selectedDateTimeRange!.end);
  }

  Future<void> pickDateRange() async {
    // final DateTime? picked = await showDatePicker(
    //     context: context,
    //     initialDate: state.selectedDateTimeRange?.start ?? DateTime.now(),
    //     firstDate: DateTime(2005, 8),
    //     lastDate: DateTime(2101));
    final timeRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2005, 8),
        lastDate: DateTime(2101),
        initialDateRange: DateTimeRange(
          start: state.selectedDateTimeRange?.start ?? DateTime.now(),
          end: state.selectedDateTimeRange?.end ?? DateTime.now(),
        ));
    if (timeRange != null && timeRange != state.selectedDateTimeRange) {
      // selectedDate = picked;
      // update();
      emit(state.copyWith(selectedDateTimeRange: timeRange));
    }
  }

  void onSelectedSize(String size) {
    emit(state.copyWith(selectSize: size));
  }
}
