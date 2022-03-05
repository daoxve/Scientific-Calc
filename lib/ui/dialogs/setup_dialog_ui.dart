import 'package:scientific_calc/exports.dart';
import 'package:scientific_calc/ui/dialogs/warning_dialog/warning_dialog_view.dart';

import 'theme_dialog/theme_dialog_view.dart';

void setupDialogUI() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.theme: (context, sheetRequest, completer) =>
        ThemeDialogView(request: sheetRequest, completer: completer),
    DialogType.warning: (context, sheetRequest, completer) =>
        WarningDialogView(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
