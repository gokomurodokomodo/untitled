import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as chart;

class CarFilterSliderWidget extends StatefulWidget {
  final double min;
  final double max;
  final Function(SfRangeValues)? onChanged;

  const CarFilterSliderWidget(
      {required this.min, required this.max, this.onChanged, super.key});

  @override
  State<StatefulWidget> createState() => _CarFilterSliderState();
}

class _CarFilterSliderState extends State<CarFilterSliderWidget> {
  SfRangeValues value = const SfRangeValues(0, 0);
  RangeController _rangeController = RangeController(
    start: 0,
    end: 0,
  );
  final FocusScopeNode _minFocusNode = FocusScopeNode();
  final FocusScopeNode _maxFocusNode = FocusScopeNode();
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _rangeController = RangeController(
      start: widget.min,
      end: widget.max,
    );
    value = SfRangeValues(widget.min, widget.max);
    _minController.text = widget.min.toString();
    _maxController.text = widget.max.toString();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(10000, 35),
      ChartData(15000, 45),
      ChartData(20000, 13),
      ChartData(25000, 63),
      ChartData(30000, 24),
      ChartData(35000, 54),
      ChartData(40000, 45),
      ChartData(45000, 35),
      ChartData(50000, 40),
      ChartData(55000, 60),
      ChartData(60000, 15),
      ChartData(65000, 35),
      ChartData(70000, 83),
      ChartData(75000, 23),
      ChartData(80000, 34),
      ChartData(85000, 44),
      ChartData(90000, 65),
      ChartData(95000, 25),
      ChartData(100000, 10)
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Từ giá',
                  style: AppStyle.styleAuthTextFieldLabel,
                ),
                SizedBox(
                  height: 6.h,
                ),
                SizedBox(
                  height: 35.h,
                  width: 153.w,
                  child: TextField(
                    focusNode: _minFocusNode,
                    controller: _minController,
                    keyboardType: TextInputType.number,
                    onChanged: (_) {
                      onChangeMin(double.parse(_));
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          bottom: 35.h / 2, left: 8.w, right: 8.w),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: AppColor.gray300,
                            width: 1,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  padding: EdgeInsets.only(top: 200.h),
                  width: 12.w,
                  height: 1.h,
                  decoration: BoxDecoration(color: AppColor.gray300),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Đến giá',
                  style: AppStyle.styleAuthTextFieldLabel,
                ),
                SizedBox(
                  height: 6.h,
                ),
                SizedBox(
                  height: 35.h,
                  width: 153.w,
                  child: TextField(
                    focusNode: _maxFocusNode,
                    controller: _maxController,
                    onChanged: (_) {
                      onChangeMax(double.parse(_));
                    },
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          bottom: 35.h / 2, left: 8.w, right: 8.w),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: AppColor.gray300,
                            width: 1,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SizedBox(
          width: double.infinity,
          child: SfRangeSelector(
            controller: _rangeController,
            activeColor: AppColor.primary600,
            min: widget.min,
            max: widget.max,
            edgeLabelPlacement: EdgeLabelPlacement.inside,
            showLabels: true,
            initialValues: value,
            stepSize: 1000,
            onChanged: (_) {
              setState(() {
                _rangeController.start = _.start;
                _rangeController.end = _.end;
                _minController.text = _.start.toString();
                _maxController.text = _.end.toString();
              });
            },
            child: SizedBox(
              height: 200.h,
              width: double.infinity,
              child: chart.SfCartesianChart(
                margin: const EdgeInsets.all(0),
                primaryXAxis: chart.NumericAxis(
                  minimum: widget.min,
                  maximum: widget.max,
                  isVisible: false,
                ),
                primaryYAxis: chart.NumericAxis(isVisible: false),
                plotAreaBorderWidth: 0,
                series: <chart.ChartSeries<ChartData, int>>[
                  chart.ColumnSeries<ChartData, int>(
                      color: AppColor.primary300,
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      // Width of the columns
                      width: 0.9,
                      spacing: 0.1),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onChangeMin(double _) {
    if(_ < widget.min) {
      return;
    } else if(_ > widget.max) {
      return;
    } else if (_ > _rangeController.end) {
      return;
    } else {
      setState(() {
        _rangeController.start = _;
      });
    }
    }

  void onChangeMax(double value) {
    if(value < widget.min) {
      return;
    } else if(value > widget.max) {
      return;
    } else if (value < _rangeController.start) {
      return;
    } else {
      setState(() {
        _rangeController.end = value;
      });
    }
  }
}

class ChartData {
  final int x;
  final int y;

  ChartData(this.x, this.y);
}
