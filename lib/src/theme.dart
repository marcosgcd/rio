import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.onThemeData)
class RioTheme extends ThemeExtension<RioTheme>
    with DiagnosticableTreeMixin, _$RioThemeTailorMixin {
  const RioTheme({
    required this.colorScheme,
    this.defaultBorderRadius = 10,
    this.buttonTheme = const RioButtonTheme(),
    this.textFieldTheme = const RioTextFieldTheme(),
  });

  @override
  final double defaultBorderRadius;
  @override
  final RioColorScheme colorScheme;
  @override
  final RioButtonTheme buttonTheme;
  @override
  final RioTextFieldTheme textFieldTheme;
  @override
  Brightness get brightness => colorScheme.brightness;

  static RioTheme of(BuildContext context) {
    return Theme.of(context).rioTheme;
  }

  ThemeData toThemeData() {
    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: colorScheme.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colorScheme.primary,
        brightness: brightness,
      ),
      extensions: [
        this,
      ],
    );
  }
}
