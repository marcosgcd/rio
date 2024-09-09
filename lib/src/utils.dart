import 'dart:collection';

import 'package:flutter/material.dart';

class RioColorUtils {
  static final HashMap<String, Color> _computedColorsCache =
      HashMap<String, Color>();

  static Color darken(Color c, [double percent = 0.1]) {
    assert(0.01 <= percent && percent <= 1);
    var f = 1 - percent;
    return Color.fromARGB(
      c.alpha,
      (c.red * f).round(),
      (c.green * f).round(),
      (c.blue * f).round(),
    );
  }

  static Color lighten(Color c, [double percent = 0.1]) {
    assert(0.01 <= percent && percent <= 1);
    var p = percent;
    return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round(),
    );
  }

  static Color computeTextColorForBackground(Color color) {
    final key = 't-${color.value}';

    if (_computedColorsCache.containsKey(key)) {
      return _computedColorsCache[key]!;
    }

    if (color.computeLuminance() >= 0.5) {
      return darken(color, 0.95);
    }

    return lighten(color, 0.95);
  }

  static Color computeTextColorForPrimary(
    Color color, {
    required Brightness brightness,
  }) {
    final key = 'p-${color.value}';

    if (_computedColorsCache.containsKey(key)) {
      return _computedColorsCache[key]!;
    }

    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: brightness,
    );

    return colorScheme.onPrimary;
  }

  static Color computeContrastColor(Color color) {
    final key = 'c-${color.value}';

    if (_computedColorsCache.containsKey(key)) {
      return _computedColorsCache[key]!;
    }
    if (color.computeLuminance() >= 0.5) {
      return darken(color, 0.9);
    }

    return lighten(color, 0.9);
  }

  static Color getSolidColorFromTransparent(
    Color foreground,
    Color background,
  ) {
    final alpha = foreground.opacity;
    final inverseAlpha = 1.0 - alpha;

    final red =
        (foreground.red * alpha + background.red * inverseAlpha).round();
    final green =
        (foreground.green * alpha + background.green * inverseAlpha).round();
    final blue =
        (foreground.blue * alpha + background.blue * inverseAlpha).round();

    return Color.fromARGB(255, red, green, blue);
  }
}
