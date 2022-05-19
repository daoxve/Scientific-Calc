import 'package:scientific_calc/exports.dart';

class WarningDialogView extends StatelessWidget {
  const WarningDialogView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: _WarningDialogContent(
        request: request!,
        completer: completer!,
      ),
    );
  }
}

class _WarningDialogContent extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const _WarningDialogContent({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.fromLTRB(16.00, 32.00, 16.00, 12.0),
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap.smallH,
              Text(
                request.title ?? '',
                style: textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              Gap.smallH,
              Text(
                request.description ?? '',
                style: textTheme.headline6!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              Gap.mediumH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (request.secondaryButtonTitle != null) ...{
                    TextButton(
                      onPressed: () => completer(
                        DialogResponse(confirmed: false),
                      ),
                      child: Text(
                        request.secondaryButtonTitle!,
                        style: textTheme.subtitle1!.copyWith(
                          color: theme.iconTheme.color!.withOpacity(0.8),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                    ),
                  },
                  TextButton(
                    onPressed: () => completer(
                      DialogResponse(confirmed: true),
                    ),
                    child: Text(
                      request.mainButtonTitle!,
                      style: textTheme.subtitle1!.copyWith(
                        color: kcError,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const Positioned(
          top: -28.00,
          child:  CircleAvatar(
            minRadius: 16.0,
            maxRadius: 28.0,
            backgroundColor: kcErrorDark,
            child: Icon(
              Icons.warning_amber,
              size: 28,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
