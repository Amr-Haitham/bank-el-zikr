import 'package:bank_el_ziker/core/layers/data/models/zikr_model.dart';
import 'package:bank_el_ziker/core/layers/data/services/hive_db.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());
  final HiveDB _hiveDB = HiveDB();

   // this gets all the azkar the user has access to and can use the counter on
  void getAllAzkar() async {
    emit(AzkarLoading());
    try {
      // Box is like a list, here we get the box so we later give it to AzkarLoaded
      Box zikrBox = await _hiveDB.openAndGetBox(boxName: zikrHiveBox);


      //this one will be deleted but i will make sure it's not used elsewhere
      Box customAzkarBox =
          await _hiveDB.openAndGetBox(boxName: customAzkarHiveBox);
      
      var listOfAzkar = List<Zikr>.from(zikrBox.values);
      // we add here custom azkar made by users to default azkar to show to the user.
      listOfAzkar.addAll(List<Zikr>.from(customAzkarBox.values));



    
      emit(AzkarLoaded(azkar: listOfAzkar));
    } catch (e) {
      emit(AzkarError());
    }
  }
}
