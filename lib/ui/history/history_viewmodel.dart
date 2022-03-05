import 'package:scientific_calc/exports.dart';

class HistoryViewModel extends BaseViewModel {
  late final Box box;

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  Future<dynamic> initHiveBox() async {
    box = Hive.box(HiveBoxes.searchDataBox);
    return box;
  }

  void insertAtIndex(int index) {
    HiveUtil.insertAtIndex(index);
  }

  void showWarningDialog() async {
    final dialogResponse = await _dialogService.showCustomDialog(
      variant: DialogType.warning,
      barrierDismissible: true,
      title: 'Delete all?',
      description: kcWarningDesc,
      mainButtonTitle: 'Yes, please.',
      secondaryButtonTitle: 'Nope',
    );

    if (dialogResponse?.confirmed == true) {
      HiveUtil.deleteAllData();
    }
  }

  void navigateBack() {
    _navigationService.back();
  }

  void navigateTo(route) {
    _navigationService.navigateTo(route);
  }
}
