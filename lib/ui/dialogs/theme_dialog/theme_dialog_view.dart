import 'package:scientific_calc/exports.dart';

import 'theme_dialog_viewmodel.dart';

class ThemeDialogView extends StatelessWidget {
  const ThemeDialogView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThemeDialogViewModel>.reactive(
      onModelReady: (model) => model.getSelectedTheme(context),
      viewModelBuilder: () => ThemeDialogViewModel(),
      builder: (context, model, child) => Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: _ThemeDialogContent(
          request: request!,
          completer: completer!,
          model: model,
        ),
      ),
    );
  }
}

class _ThemeDialogContent extends StatelessWidget {
  const _ThemeDialogContent({
    Key? key,
    required this.request,
    required this.completer,
    required this.model,
  }) : super(key: key);

  final DialogRequest request;
  final Function(DialogResponse) completer;
  final ThemeDialogViewModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.00, vertical: 24.00),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose Theme',
            style: textTheme.headline3,
          ),

          // Radio 1
          RadioListTile<RadioFields?>(
            value: model.radioOneVal,
            groupValue: model.groupVal,
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Light',
              style: textTheme.subtitle1!.copyWith(
                fontSize: 18,
              ),
            ),
            onChanged: (RadioFields? value) {
              model.toggleRadio(value);
              getThemeManager(context).setThemeMode(ThemeMode.light);
            },
          ),

          // Radio 2
          RadioListTile<RadioFields?>(
            value: model.radioTwoVal,
            groupValue: model.groupVal,
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Dark',
              style: textTheme.subtitle1!.copyWith(
                fontSize: 18,
              ),
            ),
            onChanged: (RadioFields? value) {
              model.toggleRadio(value);
              getThemeManager(context).setThemeMode(ThemeMode.dark);
            },
          ),

          // Radio 3
          RadioListTile<RadioFields?>(
            value: model.radioThreeVal,
            groupValue: model.groupVal,
            contentPadding: EdgeInsets.zero,
            title: Text(
              'System Default',
              style: textTheme.subtitle1!.copyWith(
                fontSize: 18,
              ),
            ),
            toggleable: true,
            onChanged: (RadioFields? value) {
              model.toggleRadio(value);
              getThemeManager(context).setThemeMode(ThemeMode.system);
            },
          ),
        ],
      ),
    );
  }
}
