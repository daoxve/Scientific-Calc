import 'package:scientific_calc/exports.dart';

class ThemeDialogViewModel extends BaseViewModel {
  RadioFields? groupVal = RadioFields.sysDefault;
  RadioFields? radioOneVal = RadioFields.light;
  RadioFields? radioTwoVal = RadioFields.dark;
  RadioFields? radioThreeVal = RadioFields.sysDefault;

  void toggleRadio(RadioFields? value) {
    groupVal = value!;
    notifyListeners();
  }

  void getSelectedTheme(BuildContext context) {
    if (getThemeManager(context).selectedThemeMode == ThemeMode.light) {
      groupVal = RadioFields.light;
    } else if (getThemeManager(context).selectedThemeMode == ThemeMode.dark) {
      groupVal = RadioFields.dark;
    } else if (getThemeManager(context).selectedThemeMode == ThemeMode.system) {
      groupVal = RadioFields.sysDefault;
    }
  }
}
