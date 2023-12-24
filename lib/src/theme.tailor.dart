// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioThemeTailorMixin
    on ThemeExtension<RioTheme>, DiagnosticableTreeMixin {
  double get defaultBorderRadius;
  RioColorScheme get colorScheme;
  RioButtonTheme get buttonTheme;
  RioTextFieldTheme get textFieldTheme;
  RioPopoverTheme get popoverTheme;
  Brightness get brightness;

  @override
  RioTheme copyWith({
    double? defaultBorderRadius,
    RioColorScheme? colorScheme,
    RioButtonTheme? buttonTheme,
    RioTextFieldTheme? textFieldTheme,
    RioPopoverTheme? popoverTheme,
    Brightness? brightness,
  }) {
    return RioTheme(
      defaultBorderRadius: defaultBorderRadius ?? this.defaultBorderRadius,
      colorScheme: colorScheme ?? this.colorScheme,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      textFieldTheme: textFieldTheme ?? this.textFieldTheme,
      popoverTheme: popoverTheme ?? this.popoverTheme,
    );
  }

  @override
  RioTheme lerp(covariant ThemeExtension<RioTheme>? other, double t) {
    if (other is! RioTheme) return this as RioTheme;
    return RioTheme(
      defaultBorderRadius:
          t < 0.5 ? defaultBorderRadius : other.defaultBorderRadius,
      colorScheme: colorScheme.lerp(other.colorScheme, t) as RioColorScheme,
      buttonTheme: buttonTheme.lerp(other.buttonTheme, t) as RioButtonTheme,
      textFieldTheme:
          textFieldTheme.lerp(other.textFieldTheme, t) as RioTextFieldTheme,
      popoverTheme: popoverTheme.lerp(other.popoverTheme, t) as RioPopoverTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioTheme &&
            const DeepCollectionEquality()
                .equals(defaultBorderRadius, other.defaultBorderRadius) &&
            const DeepCollectionEquality()
                .equals(colorScheme, other.colorScheme) &&
            const DeepCollectionEquality()
                .equals(buttonTheme, other.buttonTheme) &&
            const DeepCollectionEquality()
                .equals(textFieldTheme, other.textFieldTheme) &&
            const DeepCollectionEquality()
                .equals(popoverTheme, other.popoverTheme) &&
            const DeepCollectionEquality()
                .equals(brightness, other.brightness));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(defaultBorderRadius),
      const DeepCollectionEquality().hash(colorScheme),
      const DeepCollectionEquality().hash(buttonTheme),
      const DeepCollectionEquality().hash(textFieldTheme),
      const DeepCollectionEquality().hash(popoverTheme),
      const DeepCollectionEquality().hash(brightness),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioTheme'))
      ..add(DiagnosticsProperty('defaultBorderRadius', defaultBorderRadius))
      ..add(DiagnosticsProperty('colorScheme', colorScheme))
      ..add(DiagnosticsProperty('buttonTheme', buttonTheme))
      ..add(DiagnosticsProperty('textFieldTheme', textFieldTheme))
      ..add(DiagnosticsProperty('popoverTheme', popoverTheme))
      ..add(DiagnosticsProperty('brightness', brightness));
  }
}

extension RioThemeThemeData on ThemeData {
  RioTheme get rioTheme => extension<RioTheme>()!;
}
