import 'package:bank_el_ziker/core/layers/data/models/zikr_model.dart';
import 'package:hive/hive.dart';

abstract class ZikrCategoryLocalDataSource {
  Future<List<Zikr>> getZikrByCategory({String? category});
}

class ZikrCategoryLocalDataSourceImpl implements ZikrCategoryLocalDataSource {
  final Box<Zikr> zikrCategoryBox;

  ZikrCategoryLocalDataSourceImpl({required Box<Zikr> box})
      : zikrCategoryBox = box;

  @override
  Future<List<Zikr>> getZikrByCategory({String? category}) async {
    final all = zikrCategoryBox.values.toList();
    if (category == null) return all;
    return all.where((zikr) => zikr.category == category).toList();
  }
}
