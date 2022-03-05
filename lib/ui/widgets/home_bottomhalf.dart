import 'package:scientific_calc/exports.dart';

import 'package:scientific_calc/ui/home/home_viewmodel.dart';

class BottomHalf extends HookViewModelWidget<HomeViewModel> {
  const BottomHalf({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
    final theme = Theme.of(context);
    bool inv = viewModel.isInv;
    bool deg = viewModel.isDeg;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
      ),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ExpansionPanelList(
            elevation: 0,
            expansionCallback: viewModel.expansionFunction,
            expandedHeaderPadding: EdgeInsets.zero,
            children: [
              ExpansionPanel(
                backgroundColor: theme.backgroundColor,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PlainButton(
                        text: inv ? 'x²' : '√',
                        onTap: viewModel.validateActions,
                      ),
                      PlainButton(
                        text: 'π',
                        onTap: viewModel.validateActions,
                      ),
                      PlainButton(
                        text: '^',
                        onTap: viewModel.validateActions,
                      ),
                      PlainButton(
                        text: '!',
                        onTap: viewModel.validateActions,
                      ),
                    ],
                  );
                },
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PlainButton(
                          text: deg ? 'DEG' : 'RAD',
                          onTap: viewModel.validateActions,
                        ),
                        PlainButton(
                          text: inv ? 'sin⁻¹' : 'sin',
                          onTap: viewModel.validateActions,
                        ),
                        PlainButton(
                          text: inv ? 'cos⁻¹' : 'cos',
                          onTap: viewModel.validateActions,
                        ),
                        PlainButton(
                          text: inv ? 'tan⁻¹' : 'tan',
                          onTap: viewModel.validateActions,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PlainButton(
                          text: 'INV',
                          onTap: viewModel.validateActions,
                        ),
                        PlainButton(
                          text: 'e',
                          onTap: viewModel.validateActions,
                        ),
                        PlainButton(
                          text: inv ? 'eˣ' : 'ln',
                          onTap: viewModel.validateActions,
                        ),
                        PlainButton(
                          text: inv ? '10ˣ' : 'log',
                          onTap: viewModel.validateActions,
                        ),
                      ],
                    )
                  ],
                ),
                isExpanded: viewModel.canExpand,
              )
            ],
          ),
          Gap.smallH,
          Flexible(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Row 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleButton(
                      text: 'AC',
                      buttonType: ButtonType.clear,
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: '( )',
                      buttonType: ButtonType.special,
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: '%',
                      buttonType: ButtonType.special,
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: '÷',
                      buttonType: ButtonType.special,
                      onTap: viewModel.validateActions,
                      fontSize: 30.sp,
                    ),
                  ],
                ),
                Gap.mediumH,

                // Row 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleButton(
                      text: '7',
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: '8',
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: '9',
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: 'x',
                      buttonType: ButtonType.special,
                      onTap: viewModel.validateActions,
                    ),
                  ],
                ),
                Gap.mediumH,

                // Row 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleButton(
                      text: '4',
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: '5',
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: '6',
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: '-',
                      buttonType: ButtonType.special,
                      onTap: viewModel.validateActions,
                      fontSize: 36.sp,
                    ),
                  ],
                ),
                Gap.mediumH,

                // Row 4
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleButton(
                      text: '1',
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: '2',
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: '3',
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: '+',
                      buttonType: ButtonType.special,
                      onTap: viewModel.validateActions,
                      fontSize: 28.sp,
                    ),
                  ],
                ),
                Gap.mediumH,

                // Row 5
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleButton(
                      text: '0',
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: '.',
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: 'del',
                      isIcon: true,
                      icon: Icon(
                        Icons.backspace,
                        color: theme.colorScheme.onSecondary,
                      ),
                      onTap: viewModel.validateActions,
                    ),
                    CircleButton(
                      text: '=',
                      buttonType: ButtonType.equals,
                      fontSize: 28.sp,
                      onTap: viewModel.validateActions,
                    ),
                  ],
                ),
                Gap.mediumH,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
