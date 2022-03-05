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
            leading: GestureDetector(
              onTap: model.navigateBack,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 21.sp,
                color: theme.iconTheme.color,
              ),
            ),
            title: Text(
              'History',
              style: textTheme.headline2!.copyWith(
                fontSize: 20.sp,
              ),
            ),
            actions: [
              Align(
                child: GestureDetector(
                  onTap: box.isEmpty ? null : model.showWarningDialog,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.w, top: 4.h),
                    child: Text(
                      'Clear',
                      style: textTheme.headline4!.copyWith(
                        fontSize: 15.sp,
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
                              size: 158.sp,
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
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 20.h),
                          child: ListView.separated(
                            itemCount: box.length,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (ctx, i) => SizedBox(height: 10.h),
                            itemBuilder: (context, index) {
                              model.insertAtIndex(index);
                              var boxIndex = box.getAt((box.length - 1) - index);

                              return SizedBox(
                                height: 80.h,
                                child: Card(
                                  elevation: 2,
                                  color: theme.colorScheme.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ListTile(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
                                    title: Text(
                                      boxIndex.calcHistory + ' = ' + boxIndex.calcResult,
                                      style: textTheme.headline1!.copyWith(fontSize: 21.sp),
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
                  margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 24.h),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.w, top: 24.h),
                        child: Text(
                          'Current Figures:',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: kcGrey,
                          ),
                        ),
                      ),
                      Align(
                        child: box.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.only(top: 12.h),
                                child: Text(
                                  box.getAt(box.length - 1).calcHistory +
                                      ' = ' +
                                      box.getAt(box.length - 1).calcResult,
                                  style: textTheme.headline1,
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(top: 12.h),
                                child: Text(
                                  'Nothing to show here yet...',
                                  style: textTheme.headline1!.copyWith(
                                    fontSize: 14.sp,
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
