// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  const DashboardState(
      {this.selectedDateTimeRange,
      this.chartTotalOrder,
      this.orderAmount,
      this.orderCount,
      //this.chartData2,
      this.chartDataTool,
      this.orderAmountTool,
      this.orderCountTool,
      this.selectSize = "All"});
  final DateTimeRange? selectedDateTimeRange;
  final List<ChartData1>? chartTotalOrder;
  final List<ChartData>? orderCount;
  final List<ChartData>? orderAmount;
  //final List<ChartData2>? chartData3;
  final TooltipBehavior? chartDataTool;
  final TooltipBehavior? orderAmountTool;
  final TooltipBehavior? orderCountTool;
  final String selectSize;

  @override
  List<Object?> get props => [
        selectedDateTimeRange,
        chartTotalOrder,
        orderCount,
        orderAmount,
        //chartData2,
        chartDataTool,
        selectSize,
        orderAmountTool,
        orderCountTool,
      ];

  DashboardState copyWith({
    DateTimeRange? selectedDateTimeRange,
    List<ChartData1>? chartTotalOrder,
    List<ChartData>? orderCount,
    List<ChartData>? orderAmount,
    //List<ChartData2>? chartData2,
    TooltipBehavior? chartDataTool,
    TooltipBehavior? orderAmountTool,
    TooltipBehavior? orderCountTool,
    String? selectSize,
  }) {
    return DashboardState(
      selectedDateTimeRange:
          selectedDateTimeRange ?? this.selectedDateTimeRange,
      chartTotalOrder: chartTotalOrder ?? this.chartTotalOrder,
      orderCount: orderCount ?? this.orderCount,
      orderAmount: orderAmount ?? this.orderAmount,
      //chartData2: chartData2 ?? this.chartData2,
      chartDataTool: chartDataTool ?? this.chartDataTool,
      orderAmountTool: orderAmountTool ?? this.orderAmountTool,
      orderCountTool: orderCountTool ?? this.orderCountTool,
      selectSize: selectSize ?? this.selectSize,
    );
  }
}
