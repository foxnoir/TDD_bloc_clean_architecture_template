import 'package:flutter/material.dart';
import 'package:japanese_tutorials_app/core/theme/consts.dart';

ThemeData getLightTheme() {
  return _theme(_getColorScheme(Brightness.light));
}

ThemeData _theme(ColorScheme colorScheme) {
  final textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: AppFontSize.s21,
      fontWeight: AppFontWeight.bold,
      color: colorScheme.onSurface,
    ),

    /// hotel count
    headlineMedium: const TextStyle(
      fontSize: AppFontSize.s19,
      fontWeight: AppFontWeight.bold,
      color: AppColor.grey,
    ),

    /// app bar
    headlineSmall: TextStyle(
      fontSize: AppFontSize.s19,
      fontWeight: AppFontWeight.bold,
      color: colorScheme.onPrimary,
    ),

    /// bottom nav
    labelSmall: TextStyle(
      fontSize: AppFontSize.s12,
      fontWeight: AppFontWeight.medium,
      color: colorScheme.tertiary,
    ),

    /// buttons
    labelMedium: TextStyle(
      fontSize: AppFontSize.s16,
      fontWeight: AppFontWeight.bold,
      color: colorScheme.onPrimary,
    ),
    bodyMedium: TextStyle(
      fontSize: AppFontSize.s14,
      fontWeight: AppFontWeight.medium,
      color: colorScheme.tertiary,
    ),

    /// small card Text
    bodySmall: TextStyle(
      fontSize: AppFontSize.s11,
      fontWeight: AppFontWeight.medium,
      color: colorScheme.tertiary,
    ),
  );
  final themeData = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: AppFont.poppins,
    primaryColor: colorScheme.primary,
    secondaryHeaderColor: colorScheme.secondary,
    disabledColor: AppColor.darkGrey,
    scaffoldBackgroundColor: colorScheme.surface,
    colorScheme: colorScheme,
    brightness: colorScheme.brightness,
    textTheme: textTheme,
    iconTheme: IconThemeData(
      color: colorScheme.onSurface,
    ),

    /// AppBar Theme
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      centerTitle: true,
      color: colorScheme.primary,
      elevation: 0,
      titleTextStyle: textTheme.headlineSmall,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: textTheme.labelSmall?.copyWith(
        color: colorScheme.primary,
      ),
      selectedItemColor: colorScheme.primary,
      showUnselectedLabels: true,
      unselectedItemColor: colorScheme.tertiary,
      unselectedLabelStyle: textTheme.labelSmall,
    ),

    /// Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColor.lightGrey,
      thickness: 1,
      indent: 0,
      endIndent: 0,
    ),

    cardTheme: CardTheme(
      color: colorScheme.surface,
      surfaceTintColor: colorScheme.surface,
      shadowColor: colorScheme.shadow,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.surface,
        elevation: 2,
        minimumSize: const Size.fromHeight(40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: textTheme.labelMedium,
      ),
    ),
  );
  return themeData;
}

ColorScheme _getColorScheme(Brightness brightness) {
  const lightColorScheme = ColorScheme.light(
    primary: AppColor.darkPurple,
    secondary: AppColor.lightTurquoise,
    tertiary: AppColor.darkGrey,
    error: AppColor.error,
    outline: AppColor.lightGrey,
    onSurface: AppColor.grey,
  );
  return lightColorScheme;
}
