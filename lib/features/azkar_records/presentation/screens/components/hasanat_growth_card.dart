import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/journey_stats.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HasanatGrowthCard extends StatefulWidget {
  const HasanatGrowthCard({
    super.key,
    required this.stats,
    required this.totalBalance,
  });

  final JourneyStats stats;
  final int totalBalance;

  @override
  State<HasanatGrowthCard> createState() => _HasanatGrowthCardState();
}

class _HasanatGrowthCardState extends State<HasanatGrowthCard> {
  GrowthPeriod _period = GrowthPeriod.week;

  static const _periodLabel = {
    GrowthPeriod.week: "Week",
    GrowthPeriod.month: "Month",
    GrowthPeriod.year: "Year",
  };

  @override
  Widget build(BuildContext context) {
    final points = widget.stats.growthPoints(_period);
    final percentChange = widget.stats.growthPercentChange(_period);
    final maxY = points.fold<int>(1, (m, p) => p.value > m ? p.value : m);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            const Color(0xff1D6B3A),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (percentChange != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${percentChange >= 0 ? '+' : ''}${percentChange.round()}% this $_periodNoun",
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                )
              else
                const SizedBox.shrink(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Hasanat growth",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  Text(
                    ArabicNumbers().convert(widget.totalBalance).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: GrowthPeriod.values.map((period) {
                final selected = period == _period;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _period = period),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: selected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Text(
                        _periodLabel[period]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: selected
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 22,
                      interval: (points.length / 6).clamp(1, 1000).toDouble(),
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= points.length) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            points[index].label,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 10),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                minX: 0,
                maxX: (points.length - 1).toDouble(),
                minY: 0,
                maxY: maxY.toDouble(),
                lineTouchData: const LineTouchData(enabled: false),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    curveSmoothness: 0.4,
                    barWidth: 3,
                    color: Colors.white,
                    dotData: FlDotData(
                      show: true,
                      checkToShowDot: (spot, barData) =>
                          spot.x == points.length - 1,
                      getDotPainter: (spot, percent, bar, index) =>
                          FlDotCirclePainter(
                        radius: 4,
                        color: Colors.white,
                        strokeWidth: 0,
                      ),
                    ),
                    belowBarData: BarAreaData(show: false),
                    spots: [
                      for (var i = 0; i < points.length; i++)
                        FlSpot(i.toDouble(), points[i].value.toDouble()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String get _periodNoun {
    switch (_period) {
      case GrowthPeriod.week:
        return "week";
      case GrowthPeriod.month:
        return "month";
      case GrowthPeriod.year:
        return "year";
    }
  }
}
