import 'package:scientific_calc/exports.dart';

class PlainButton extends StatelessWidget {
  const PlainButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.fontSize,
  }) : super(key: key);

  final String text;
  final Function onTap;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return TextButton(
      child: Text(
        text,
        style: textTheme.headline3!.copyWith(
          fontSize: fontSize ?? 22.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      onPressed: () => onTap(text),
    );
  }
}
