import 'package:scientific_calc/exports.dart';

class HelpViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateBack() {
    _navigationService.back();
  }

  void navigateTo(route) {
    _navigationService.navigateTo(route);
  }
}