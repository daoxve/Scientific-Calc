import 'package:scientific_calc/exports.dart';
import 'package:scientific_calc/ui/home/home_viewmodel.dart';

final _log = getLogger('CircleButton');

class CircleButton extends HookViewModelWidget<HomeViewModel> {
  const CircleButton({
    Key? key,
    this.text,
    this.buttonType = ButtonType.plain,
    required this.onTap,
    this.fontSize,
    this.isIcon = false,
    this.icon,
  })  : assert(buttonType != null),
        super(key: key);

  final String? text;
  final ButtonType? buttonType;
  final Function onTap;
  final double? fontSize;
  final bool isIcon;
  final Icon? icon;

  @override
  Widget buildViewModelWidget(BuildContext context, viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => onTap(text),
      child: CircleAvatar(
        radius: viewModel.canExpand
            ? _getFullRadiusForScreenSize(context)
            : _getShrinkedRadiusForScreenSize(context),
        // radius: viewModel.canExpand ? 20.0 : 30.00,
        backgroundColor: _getButtonColor(buttonType, context),
        child: !isIcon
            ? Text(
                text!,
                style: textTheme.headline3!.copyWith(
                  fontSize: fontSize ?? (screenHeight < 750 ? 20 : 28),
                  fontWeight: FontWeight.w400,
                ),
              )
            : icon,
      ),
    );
  }

  double _getShrinkedRadiusForScreenSize(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight <= 750) {
      _log.i('Size less than 750');
      return 21;
    } else if (screenHeight <= 1080) {
      _log.i('Size less than 1080');
      return 30;
    } else {
      _log.i('Size of $screenHeight');
      return 50;
    }
  }

  double _getFullRadiusForScreenSize(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight <= 750) {
      _log.i('Full Size less than 750');
      return 16;
    } else if (screenHeight <= 1080) {
      _log.i('Full Size less than 1080');
      return 24;
    } else {
      _log.i('Full Size of $screenHeight');
      return 38;
    }
  }

  _getButtonColor(dynamic type, BuildContext context) {
    final theme = Theme.of(context);

    switch (type) {
      case ButtonType.plain:
        return theme.colorScheme.secondary;
      case ButtonType.special:
        return kcSpecialButton;
      case ButtonType.equals:
        return kcEqualsButton;
      case ButtonType.clear:
        return kcClearButton;
      default:
        return theme.colorScheme.secondary;
    }
  }
}
