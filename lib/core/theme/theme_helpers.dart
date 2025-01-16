import 'package:flutter/material.dart';

// Converts a Hex color into a MaterialColor
MaterialColor createMaterialColor({required Color color}) {
  final swatch = <int, Color>{};
  final strengths = <double>[.05];

  for (var i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (final strength in strengths) {
    final ds = 0.5 - strength;
    swatch[(strength * 1000).toInt()] = Color.fromRGBO(
      (color.r + ((ds < 0 ? color.r : (255 - color.r)) * ds))
          .clamp(0, 255)
          .toInt(),
      (color.g + ((ds < 0 ? color.g : (255 - color.g)) * ds))
          .clamp(0, 255)
          .toInt(),
      (color.b + ((ds < 0 ? color.b : (255 - color.b)) * ds))
          .clamp(0, 255)
          .toInt(),
      1,
    );
  }

  /// Manually construct the 32-bit integer representation of the color
  final colorValue = (color.a.toInt() << 24) |
      (color.r.toInt() << 16) |
      (color.g.toInt() << 8) |
      color.b.toInt();

  return MaterialColor(colorValue, swatch);
}
