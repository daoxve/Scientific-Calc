import 'package:scientific_calc/exports.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: HomeView, initial: true),
    CupertinoRoute(page: HelpView),
    CupertinoRoute(page: HistoryView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  //? Serves no purpose besides the annotation attached to it
}
