import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:bank_el_ziker/1_ui/core/consts/text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../3_data/models/day_zikr_record.dart';

const Map<int, String> mapOfDays = {
  1: "الإثنين",
  2: "الثلاثاء",
  3: "الأربعاء",
  4: "الخميس",
  5: "الجمعة",
  6: "السبت",
  7: "الأحد",
};

class LineChartForDayRecords extends StatelessWidget {
  final List<DayZikrRecord> records;

  int _calculateAllDayAzkarRecord(DayZikrRecord dayZikrRecord) {
    int total = 0;
    for (var singleZikrRecord in dayZikrRecord.azkarRecordById.values) {
      total += singleZikrRecord;
    }
    return total;
  }

  int _getMinOrMaxDayRecordInAWeekRecord(
      {required List<DayZikrRecord> records, required bool isMin}) {
    int x;
    if (isMin) {
      x = _calculateAllDayAzkarRecord(records.first);
      for (var r in records) {
        if (_calculateAllDayAzkarRecord(r) < x) {
          x = _calculateAllDayAzkarRecord(r);
        }
      }
    } else {
      x = _calculateAllDayAzkarRecord(records.first);
      for (var r in records) {
        if (_calculateAllDayAzkarRecord(r) > x) {
          x = _calculateAllDayAzkarRecord(r);
        }
      }
    }
    return x;
  }

  List<FlSpot> _generateLineChartBarDataSpots(List<DayZikrRecord> records) {
    List<FlSpot> spots = [];
    int i = 0;
    for (var r in records.reversed) {
      i++;
      spots
          .add(FlSpot(i.toDouble(), _calculateAllDayAzkarRecord(r).toDouble()));
    }
    return spots;
  }

  Widget customGetTitle(
      double dayIndex, TitleMeta meta, List<DayZikrRecord> records) {
    return Text(
        mapOfDays[records.reversed
                .toList()[dayIndex.toInt() - 1]
                .dateTime
                .weekday] ??
            "#",
        style: cairoTextStyle(10.sp, FontWeight.w200, null, appDarkTextColor));
  }

  Widget customTextForVerticalTitles(
    double dayIndex,
    TitleMeta meta,
  ) {
    return Container(
      margin: EdgeInsets.only(right: 3.w),
      child: Text(dayIndex.toInt().toString(),
          textAlign: TextAlign.right,
          style:
              cairoTextStyle(10.sp, FontWeight.w500, null, appDarkTextColor)),
    );
  }

  const LineChartForDayRecords({super.key, required this.records});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: true),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (index, titleMeta) =>
                    customGetTitle(index, titleMeta, records),
              ),
            ),
            rightTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32.w,
              getTitlesWidget: (index, titleMeta) => const Text(""),
            )),
            leftTitles: AxisTitles(
                sideTitles: SideTitles(
              reservedSize: 32.w,
              showTitles: true,
              getTitlesWidget: (index, titleMeta) =>
                  customTextForVerticalTitles(index, titleMeta),
            )),
            topTitles: const AxisTitles(),
          ),
          borderData: FlBorderData(show: true),
          minX: 1,
          maxX: 7,
          minY:
              _getMinOrMaxDayRecordInAWeekRecord(records: records, isMin: true)
                  .toDouble(),
          maxY: (_getMinOrMaxDayRecordInAWeekRecord(
                  records: records, isMin: false)
              .toDouble()),
          lineBarsData: [
            LineChartBarData(
              barWidth: 3,
              spots: _generateLineChartBarDataSpots(records),
              isCurved: false,
              color: appGreen,
              dotData: const FlDotData(show: true),
              belowBarData: BarAreaData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
