import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rio/src/utils.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'color_scheme.tailor.dart';

@TailorMixinComponent()
class RioColorScheme extends ThemeExtension<RioColorScheme>
    with DiagnosticableTreeMixin, _$RioColorSchemeTailorMixin {
  const RioColorScheme({
    required this.brightness,
    required this.primary,
    required this.onPrimary,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
  });

  factory RioColorScheme.fromSeed(
    Color seedColor, {
    Brightness brightness = Brightness.light,
  }) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    );

    Color onPrimary;
    Color background;
    Color surface;
    if (brightness == Brightness.light) {
      onPrimary = lighten(colorScheme.primary, 0.9);
      background = lighten(colorScheme.primary, 0.9);
      surface = lighten(colorScheme.primary, 0.95);
    } else {
      onPrimary = colorScheme.onPrimary;
      background = darken(colorScheme.primary, 0.9);
      surface = darken(colorScheme.primary, 0.82);
    }

    return RioColorScheme(
      brightness: brightness,
      primary: colorScheme.primary,
      onPrimary: onPrimary,
      background: background,
      onBackground: colorScheme.onBackground,
      surface: surface,
      onSurface: colorScheme.onSurface,
    );
  }

  @override
  final Brightness brightness;
  @override
  final Color primary;
  @override
  final Color onPrimary;
  @override
  final Color background;
  @override
  final Color onBackground;
  @override
  final Color surface;
  @override
  final Color onSurface;
}
