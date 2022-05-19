import 'package:scientific_calc/exports.dart';

import 'history_viewmodel.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ViewModelBuilder<HistoryViewModel>.reactive(
      onModelReady: (model) => model.initHiveBox(),
      viewModelBuilder: () => HistoryViewModel(),
      builder: (context, model, child) => ValueListenableBuilder(
        valueListenable: model.box.listenable(),
        builder: (BuildContext context, Box box, Widget? _) => Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: theme.colorScheme.secondary,
            // leading: ,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: model.navigateBack,
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        size: 24,
                        color: theme.iconTheme.color,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        'Back',
                        style: TextStyle(color: theme.iconTheme.color),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  'History',
                  style: textTheme.headline2!.copyWith(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
              ],
            ),
            actions: [
              Align(
                child: GestureDetector(
                  onTap: box.isEmpty ? null : model.showWarningDialog,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.00, top: 4.0),
                    child: Text(
                      'Clear',
                      style: textTheme.headline4!.copyWith(
                        fontSize: 15,
                        color: box.isEmpty ? theme.iconTheme.color : kcError,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: theme.backgroundColor,
                  ),
                  child: box.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.query_stats_sharp,
                              size: 158,
                              color: theme.iconTheme.color!.withOpacity(0.7),
                            ),
                            Text(
                              'Your recent calculations go here',
                              style: textTheme.headline3!.copyWith(
                                color: kcGrey,
                              ),
                            ),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(
                              16.00, 16.00, 16.00, 20.0),
                          child: ListView.separated(
                            itemCount: box.length,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (ctx, i) =>
                                const SizedBox(height: 10.0),
                            itemBuilder: (context, index) {
                              model.insertAtIndex(index);
                              var boxIndex =
                                  box.getAt((box.length - 1) - index);

                              return SizedBox(
                                height: 80.00,
                                child: Card(
                                  elevation: 2,
                                  color: theme.colorScheme.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 18.00, vertical: 5.0),
                                    title: Text(
                                      boxIndex.calcHistory +
                                          ' = ' +
                                          boxIndex.calcResult,
                                      style: textTheme.headline1!.copyWith(
                                        fontSize: 21.00,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ),
              ),
              Flexible(
                child: Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.fromLTRB(12.00, 0, 12.00, 24.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 24.00, top: 24.0),
                        child: Text(
                          'Current Figures:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: kcGrey,
                          ),
                        ),
                      ),
                      Align(
                        child: box.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(
                                  box.getAt(box.length - 1).calcHistory +
                                      ' = ' +
                                      box.getAt(box.length - 1).calcResult,
                                  style: textTheme.headline1,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(
                                  'Nothing to show here yet...',
                                  style: textTheme.headline1!.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
