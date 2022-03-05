import 'package:scientific_calc/exports.dart';

part 'search_data.g.dart';

@HiveType(typeId: 2)
class SearchData {
  @HiveField(0)
  String calcHistory;

  @HiveField(1)
  String calcResult;

  SearchData({
    required this.calcHistory,
    required this.calcResult,
  });
}
