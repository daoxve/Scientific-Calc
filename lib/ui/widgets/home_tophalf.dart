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

    return Container(
      height: 370.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.r, bottom: 12.h),
            child: Text(
              viewModel.history,
              style: textTheme.headline1!.copyWith(
                fontSize: 24.sp,
                color: kcGrey,
              ),
            ),
          ),
          SizedBox(
            height: 65.h,
            width: ScreenUtil().screenWidth - 15.w,
            child: ListView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              padding: EdgeInsets.only(bottom: 16.h, right: 16.w, left: 8.w),
              children: [
                Text(
                  viewModel.displayText,
                  style: textTheme.headline1!.copyWith(
                    fontSize: 48.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
