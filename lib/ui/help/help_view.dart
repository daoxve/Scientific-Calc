import 'package:scientific_calc/exports.dart';

import 'help_viewmodel.dart';

class HelpView extends StatelessWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ViewModelBuilder<HelpViewModel>.reactive(
      viewModelBuilder: () => HelpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 170.00,
              leading: GestureDetector(
                  onTap: model.navigateBack,
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        size: 24,
                        color: theme.iconTheme.color,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(color: theme.iconTheme.color),
                      )
                    ],
                  ),
                ),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Help',
                  style: textTheme.headline1,
                ),
                centerTitle: true,
                titlePadding: const EdgeInsetsDirectional.only(bottom: 13.0),
              ),
              backgroundColor: theme.colorScheme.secondary,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Gap.largeH,
                      Text(
                        'Use your Calculator',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyText1!.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap.smallH,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          kcHelpParagraph1,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyText1!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        'Do Advanced Math',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyText1!.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap.smallH,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          kcHelpParagraph2,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyText1!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Gap.smallH,
                      Text(
                        '© David Coker',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap.largeH,
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
