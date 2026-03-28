import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:flutter/material.dart';

class TabbarOfAzkarRecord extends StatefulWidget {
  const TabbarOfAzkarRecord({
    super.key,
    required this.allWeekAzkarRecordsById,
    required this.firstDayAzkarRecord,
    required this.allAzkar,
  });

  final Map<int, int> allWeekAzkarRecordsById;
  final Map<int, int> firstDayAzkarRecord;
  final List<ZikrEntity> allAzkar;

  @override
  State<TabbarOfAzkarRecord> createState() => _TabbarOfAzkarRecordState();
}

class _TabbarOfAzkarRecordState extends State<TabbarOfAzkarRecord> {
  List<ZikrEntity> getSortedFilteredAzkar(Map<int, int> mapAzkarRecord) {
    List<ZikrEntity> filteredAzkar = widget.allAzkar.where((zikr) {
      int? recordValue = mapAzkarRecord[zikr.id];
      return recordValue != null && recordValue != 0;
    }).toList();

    filteredAzkar.sort((a, b) {
      int valueA = mapAzkarRecord[a.id] ?? 0;
      int valueB = mapAzkarRecord[b.id] ?? 0;
      return valueB.compareTo(valueA);
    });

    return filteredAzkar;
  }

  @override
  Widget build(BuildContext context) {
    final dailyAzkar = getSortedFilteredAzkar(widget.firstDayAzkarRecord);
    final weeklyAzkar = getSortedFilteredAzkar(widget.allWeekAzkarRecordsById);

    final maxItems = dailyAzkar.length > weeklyAzkar.length
        ? dailyAzkar.length
        : weeklyAzkar.length;
    final viewHeight = maxItems == 0 ? 100.0 : maxItems * 81.0;

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(42),
            ),
            child: TabBar(
              dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 0),
              indicator: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(42),
              ),
              labelColor:
                  GeneralUtils.isLightTheme(context) ? appWhite : appDark,
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
              unselectedLabelColor:
                  GeneralUtils.isLightTheme(context) ? appDark : appWhite,
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
              tabs: const [
                SizedBox(
                  width: double.infinity,
                  child: Tab(text: "يومي"),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Tab(text: "اسبوعي"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: viewHeight,
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                _AzkarListView(
                  records: widget.firstDayAzkarRecord,
                  sortedAzkar: dailyAzkar,
                ),
                _AzkarListView(
                  records: widget.allWeekAzkarRecordsById,
                  sortedAzkar: weeklyAzkar,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AzkarListView extends StatelessWidget {
  final Map<int, int> records;
  final List<ZikrEntity> sortedAzkar;

  const _AzkarListView({
    required this.records,
    required this.sortedAzkar,
  });

  @override
  Widget build(BuildContext context) {
    if (sortedAzkar.isEmpty) {
      return Center(
        child: Text(
          "لم يتم العثور على أي إحداثيات",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: appRed),
        ),
      );
    }

    return Column(
      children: sortedAzkar.map((azkar) {
        int value = records[azkar.id] ?? 0;

        return Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          margin: const EdgeInsets.only(bottom: 20.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(width: 1, color: appGray),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value != 0 ? ArabicNumbers().convert(value) : "-",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Text(
                  azkar.content,
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
