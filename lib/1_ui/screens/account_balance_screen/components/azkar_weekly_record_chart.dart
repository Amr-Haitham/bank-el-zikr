import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
      context, double dayIndex, TitleMeta meta, List<DayZikrRecord> records) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Text(
          mapOfDays[records.reversed
                  .toList()[dayIndex.toInt() - 1]
                  .dateTime
                  .weekday] ??
              "#",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10)),
    );
  }

  Widget customTextForVerticalTitles(
    context,
    double dayIndex,
    TitleMeta meta,
  ) {
    return Container(
      margin: const EdgeInsets.only(right: 3),
      child: Text(ArabicNumbers().convert(dayIndex.toInt().toString()),
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10)),
    );
  }

  const LineChartForDayRecords({super.key, required this.records});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          lineTouchData: LineTouchData(
            enabled: true,
            // touchCallback:
            //     (FlTouchEvent event, LineTouchResponse? touchResponse) {
            //   if (event.isInterestedForInteractions && touchResponse != null) {
            //     final touchedSpot = touchResponse.lineBarSpots?.first;
            //     if (touchedSpot != null) {
            //       // Do something with the touched spot data
            //       final spotValue = touchedSpot.y;
            //       print(
            //           'Touched spot value: \$${spotValue.toStringAsFixed(2)}');
            //     }
            //   }
            // },
            touchTooltipData: LineTouchTooltipData(tooltipBgColor: Theme.of(context).cardColor,tooltipPadding: const EdgeInsets.symmetric(horizontal: 15),tooltipHorizontalAlignment: FLHorizontalAlignment.center,
              getTooltipItems: (List<LineBarSpot> touchedSpots) {
                return touchedSpots.map((touchedSpot) {
                  // Add dollar sign to the tooltip
                  return LineTooltipItem(ArabicNumbers().convert(touchedSpot.y.toInt()),
                      Theme.of(context).textTheme.bodyMedium!);
                }).toList();
              },
            ),
            handleBuiltInTouches:
                true, // Ensure built-in touch handling is enabled
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (index, titleMeta) =>
                    customGetTitle(context, index, titleMeta, records),
              ),
            ),
            rightTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              getTitlesWidget: (index, titleMeta) => const Text(""),
            )),
            leftTitles: AxisTitles(
                sideTitles: SideTitles(
              reservedSize: 32,
              showTitles: true,
              getTitlesWidget: (index, titleMeta) =>
                  customTextForVerticalTitles(context, index, titleMeta),
            )),
            topTitles: const AxisTitles(),
          ),
          borderData: FlBorderData(show: false),
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
              curveSmoothness: .5,
              preventCurveOverShooting: true,
              barWidth: 3,
              spots: _generateLineChartBarDataSpots(records),
              isCurved: true,
              color: Theme.of(context).brightness == Brightness.dark
                  ? appDarkGold
                  : appLightGold,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
