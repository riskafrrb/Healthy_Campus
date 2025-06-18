import 'package:flutter/material.dart';
import 'package:healthy_campus/utill/style.dart';
import 'package:sizer/sizer.dart';

ThemeData themeData = ThemeData(
  fontFamily: 'openSans',
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: const Color(0xff7AA476),
    actionsIconTheme: IconThemeData(
      color: const Color(0xff41403f),
      size: 18.sp,
      applyTextScaling: true,
    ),
    iconTheme: IconThemeData(
      color: Color(0xff41403f),
      size: 18.sp,
      applyTextScaling: true,
    ),
    titleTextStyle: openSansRegular.copyWith(
      fontSize: 16.sp,
      color: Color(0xff41403f),
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xff7AA476),
  splashColor: Colors.transparent,
  secondaryHeaderColor: const Color(0xff7AA476),
  brightness: Brightness.light,
  focusColor: const Color(0xFFADC4C8),
  hintColor: const Color(0xFF52575C),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: const MaterialColor(
      0xff7AA476,
      <int, Color>{
        50: Color(0xff7AA476),
        100: Color(0xff7AA476),
        200: Color(0xff7AA476),
        300: Color(0xff7AA476),
        400: Color(0xff7AA476),
        500: Color(0xff7AA476),
        600: Color(0xff7AA476),
        700: Color(0xff7AA476),
        800: Color(0xff7AA476),
        900: Color(0xff7AA476),
      },
    ),
    accentColor: const Color(0xffFED766),
    backgroundColor: const Color(0xFFC0E2E2),
    cardColor: const Color(0xffFED766),
    errorColor: const Color(0xffFE4A49),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    },
  ),
  primaryTextTheme: TextTheme(
    bodyMedium: openSansRegular.copyWith(
      fontSize: 15.sp,
      color: const Color(0xff41403f),
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: openSansRegular.copyWith(
      fontSize: 15.sp,
      color: const Color(0xff41403f),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 3.w),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(style: BorderStyle.none, width: 0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xffa5a5a5), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
          color: const Color(0xff7AA476).withOpacity(0.7), width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
          color: const Color(0xffdc5555).withOpacity(0.7), width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
          color: const Color(0xffdc5555).withOpacity(0.7), width: 1.5),
    ),
    filled: true,
    fillColor: const Color(0Xffa5a5a5).withOpacity(0.04),
    isDense: true,
    hintStyle: openSansRegular.copyWith(
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xffa5a5a5),
    ),
    alignLabelWithHint: true,
  ),
);
