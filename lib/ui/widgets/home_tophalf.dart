import 'package:scientific_calc/exports.dart';
import 'package:scientific_calc/ui/home/home_viewmodel.dart';

class TopHalf extends HookViewModelWidget<HomeViewModel> {
  const TopHalf({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Material(
      color: theme.colorScheme.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Container(
        height: 370,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 12.0),
              child: Text(
                viewModel.history,
                style: textTheme.headline1!.copyWith(
                  fontSize: 24,
                  color: kcGrey,
                ),
              ),
            ),
            SizedBox(
              height: 65.00,
              width: MediaQuery.of(context).size.width - 15.00,
              child: ListView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                padding: const EdgeInsets.only(
                    bottom: 16.00, right: 16.00, left: 8.0),
                children: [
                  Text(
                    viewModel.displayText,
                    style: textTheme.headline1!.copyWith(
                      fontSize: 48,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
