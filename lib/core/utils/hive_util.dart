import 'package:scientific_calc/exports.dart';

class HiveUtil {
  // Adds Data to Hive Box
  static void addData(dynamic value) async {
    var box = await Hive.openBox(HiveBoxes.searchDataBox);
    box.add(value);
  }

  /// Updates data in Hive Box
  static void updateData(String key, String value) async {
    var box = await Hive.openBox(HiveBoxes.searchDataBox);
    box.put(key, value);
  }

  // Retrieves Data from Hive Box
  static Future<dynamic> getData(String key) async {
    var box = await Hive.openBox(HiveBoxes.searchDataBox);
    return box.get(key);
  }

  // Deletes all data from a particular Hive Box
  static void deleteData(String key) async {
    var box = await Hive.openBox(HiveBoxes.searchDataBox);
    box.delete(key);
  }

  //Deletes all data from all Hive boxes
  static Future<void> deleteAllData() async {
    var box = await Hive.openBox(HiveBoxes.searchDataBox);
    await box.clear();
  }

  // Inserts a key-value pair at a particular box index
  static void insertAtIndex(int index) async{
    var box = await Hive.openBox(HiveBoxes.searchDataBox);
    await box.getAt(index);
  }

  // Deletes a key-value pair at a particular box index
  static void deleteAtIndex(int index) async {
    var box = await Hive.openBox(HiveBoxes.searchDataBox);
    await box.deleteAt(index);
  }
}
