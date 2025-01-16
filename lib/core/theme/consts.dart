import 'dart:ui';

import 'package:flutter/material.dart';

class AppConst {
  const AppConst._();

  static const double navIconSize = 25;
  static const double acticveNavIconSize = 35;
  static const double cardPadding = 16;
  static const double cardIconSize = 15;
}

class AppColor {
  const AppColor._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color darkGrey = Color(0xFF595959);
  static const Color grey = Color(0xFF222222);
  static const Color lightGrey = Color(0xFFE9E9E9);
  static const Color boxGrey = Color(0xFF9E9E9E);
  static const Color error = Color(0xFF771305);

  static const Color darkPurple = Color(0xFF473678);
  static const Color lightPurple = Color(0xFFB385D7);
  static const Color lightTurquoise = Color(0xFF64C0B5);
  static const Color turquoise = Color(0xFF64C0B5);
  static const Color darkTurquoise = Color(0xFF1E464C);
}

class AppFont {
  const AppFont._();

  static const poppins = 'Poppins';
  static const aeonik = 'Aeonik';
}

class AppFontWeight {
  const AppFontWeight._();

  static const FontWeight light = FontWeight.w300;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class AppFontSize {
  const AppFontSize._();

  /// details
  static const double s11 = 11;

  /// bottom nav
  static const double s12 = 12;

  /// error banner
  static const double s14 = 14;

  /// button
  static const double s16 = 16;

  /// hotels
  static const double s17 = 17;

  /// prize  small devices
  static const double s18 = 18;

  /// hotel count
  static const double s19 = 19;

  /// hotel name
  static const double s21 = 21;

  /// price
  static const double s23 = 22;
}
