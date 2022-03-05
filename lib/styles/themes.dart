import 'package:flutter/material.dart';

import 'colors.dart';
import 'textstyles.dart';

ThemeData lightTheme = ThemeData(
  backgroundColor: kcWhite,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kcSecondary,
    onSecondary: kcWhite,
    brightness: Brightness.light,
  ),
  iconTheme: const IconThemeData(color: kcBlack),
  textTheme: TextTheme(
    headline1: kHeadline1.copyWith(color: kcBlack),
    headline2: kHeadline2.copyWith(color: kcBlack),
    headline3: kHeadline3.copyWith(color: kcBlack),
    headline5: kHeadline5.copyWith(color: kcBlack),
    headline6: kHeadline6.copyWith(color: kcBlack),
    subtitle1: kSubtitle1.copyWith(color: kcBlack),
    subtitle2: kSubtitle2.copyWith(color: kcBlack54),
  ),
  popupMenuTheme: PopupMenuThemeData(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    color: const Color(0xFFF6F7FE),
  ),
  hintColor: Colors.black,
);

ThemeData darkTheme = ThemeData(
  backgroundColor: kcDark,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kcDarkAccent,
    onSecondary: kcBlack,
    background: kcDarkAccent,
    brightness: Brightness.dark,
  ),
  iconTheme: const IconThemeData(color: kcWhite),
  textTheme: TextTheme(
    headline1: kHeadline1.copyWith(color: kcWhite),
    headline2: kHeadline2.copyWith(color: kcWhite),
    headline3: kHeadline3.copyWith(color: kcWhite),
    headline5: kHeadline5.copyWith(color: kcWhite),
    headline6: kHeadline6.copyWith(color: kcWhite),
    subtitle1: kSubtitle1.copyWith(color: kcWhite),
    subtitle2: kSubtitle2.copyWith(color: kcWhite54),
  ),
  popupMenuTheme: PopupMenuThemeData(
    elevation: 2,
    enableFeedback: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    color: kcDarkPopup,
  ),
  hintColor: Colors.white,
);
