import 'package:scientific_calc/exports.dart';
import 'package:scientific_calc/ui/home/home_viewmodel.dart';

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

    return GestureDetector(
      onTap: () => onTap(text),
      child: CircleAvatar(
        radius: viewModel.canExpand ? 20.h : 30.h,
        backgroundColor: _getButtonColor(buttonType, context),
        child: !isIcon
            ? Text(
                text!,
                style: textTheme.headline3!.copyWith(
                  fontSize: fontSize ?? 22.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
            : icon,
      ),
    );
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
