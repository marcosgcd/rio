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
    this.bottomNavigationTheme = const RioBottomNavigationTheme.defaultTheme(),
    this.buttonTheme = const RioButtonTheme.defaultTheme(),
    this.iconButtonTheme = const RioIconButtonTheme.defaultTheme(),
    this.toggleButtonsTheme = const RioToggleButtonsTheme.defaultTheme(),
    this.textFieldTheme = const RioTextFieldTheme.defaultTheme(),
    this.pinFieldTheme = const RioPinFieldTheme.defaultTheme(),
    this.popoverTheme = const RioPopoverTheme.defaultTheme(),
    this.checkboxTheme = const RioCheckboxTheme.defaultTheme(),
    this.avatarTheme = const RioAvatarTheme.defaultTheme(),
  });

  @override
  final double defaultBorderRadius;
  @override
  final RioColorScheme colorScheme;
  @override
  final RioButtonTheme buttonTheme;
  @override
  final RioBottomNavigationTheme bottomNavigationTheme;
  @override
  final RioIconButtonTheme iconButtonTheme;
  @override
  final RioToggleButtonsTheme toggleButtonsTheme;
  @override
  final RioCheckboxTheme checkboxTheme;
  @override
  final RioTextFieldTheme textFieldTheme;
  @override
  final RioPinFieldTheme pinFieldTheme;
  @override
  final RioPopoverTheme popoverTheme;
  @override
  final RioAvatarTheme avatarTheme;
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
