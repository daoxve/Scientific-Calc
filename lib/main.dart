import 'package:scientific_calc/exports.dart';
import 'package:device_preview/device_preview.dart';
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

  runApp(
    DevicePreview(
      builder: (context) => const App(),
    ),
  );
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
        builder: DevicePreview.appBuilder,
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      ),
    );
  }
}
