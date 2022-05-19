import 'package:scientific_calc/exports.dart';
import 'package:scientific_calc/ui/dialogs/setup_dialog_ui.dart';

import 'core/models/search_data.dart';
import 'styles/themes.dart' as _themes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(SearchDataAdapter());
  await Hive.openBox(HiveBoxes.searchDataBox);

  setupLocator();
  setupDialogUI();
  await ThemeManager.initialise();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      statusBarColorBuilder: (theme) => theme!.colorScheme.secondary,
      darkTheme: _themes.darkTheme,
      lightTheme: _themes.lightTheme,
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        title: 'Scientific Calculator',
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      ),
    );
  }
}
