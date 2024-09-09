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
    required this.popover,
    required this.onPopover,
    required this.caption,
  });

  factory RioColorScheme.fromSeed(
    Color seedColor, {
    Brightness brightness = Brightness.light,
  }) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    );

    Color background;
    Color surface;
    Color popover;
    if (brightness == Brightness.light) {
      background = RioColorUtils.lighten(colorScheme.primary, 0.9);
      surface = RioColorUtils.lighten(colorScheme.primary, 0.95);
      popover = RioColorUtils.lighten(colorScheme.primary, 0.80);
    } else {
      background = RioColorUtils.darken(colorScheme.primary, 0.9);
      surface = RioColorUtils.darken(colorScheme.primary, 0.82);
      popover = RioColorUtils.darken(colorScheme.primary, 0.70);
    }

    return RioColorScheme(
      brightness: brightness,
      primary: colorScheme.primary,
      onPrimary: colorScheme.onPrimary,
      background: background,
      onBackground: colorScheme.onSurface,
      surface: surface,
      onSurface: colorScheme.onSurface,
      popover: popover,
      onPopover: RioColorUtils.computeTextColorForBackground(popover),
      caption: colorScheme.onSurface.withOpacity(0.5),
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
  @override
  final Color popover;
  @override
  final Color onPopover;
  @override
  final Color caption;
}
