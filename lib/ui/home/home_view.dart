import 'package:scientific_calc/exports.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          leading: PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            iconSize: 25.sp,
            itemBuilder: (context) => model.popupItems,
            onSelected: model.popupActions,
            offset: const Offset(35, 50),
          ),
          elevation: 0,
          iconTheme: theme.iconTheme,
          backgroundColor: theme.colorScheme.secondary,
        ),
        body: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Flexible(
              fit: FlexFit.tight,
              child: TopHalf(),
            ),
            Flexible(
              flex: 3,
              child: BottomHalf(),
            ),
          ],
        ),
      ),
    );
  }
}
