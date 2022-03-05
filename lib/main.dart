import 'package:scientific_calc/exports.dart';
import 'package:scientific_calc/ui/dialogs/setup_dialog_ui.dart';

import 'models/search_data.dart';
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
    return ScreenUtilInit(
      designSize: const Size(414, 882),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => ThemeBuilder(
        statusBarColorBuilder: (theme) => theme!.colorScheme.secondary,
        darkTheme: _themes.darkTheme,
        lightTheme: _themes.lightTheme,
        builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
          title: 'Scientific Calculator',
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
        ),
      ),
    );
  }
}
