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
  RioIconButtonTheme get iconButtonTheme;
  RioToggleButtonsTheme get toggleButtonsTheme;
  RioCheckboxTheme get checkboxTheme;
  RioTextFieldTheme get textFieldTheme;
  RioPinFieldTheme get pinFieldTheme;
  RioPopoverTheme get popoverTheme;
  RioAvatarTheme get avatarTheme;
  RioContainerTheme get containerTheme;
  RioNavigationBarTheme get navigationBarVerticalTheme;
  RioNavigationBarTheme get navigationBarHorizontalTheme;
  Brightness get brightness;

  @override
  RioTheme copyWith({
    double? defaultBorderRadius,
    RioColorScheme? colorScheme,
    RioButtonTheme? buttonTheme,
    RioIconButtonTheme? iconButtonTheme,
    RioToggleButtonsTheme? toggleButtonsTheme,
    RioCheckboxTheme? checkboxTheme,
    RioTextFieldTheme? textFieldTheme,
    RioPinFieldTheme? pinFieldTheme,
    RioPopoverTheme? popoverTheme,
    RioAvatarTheme? avatarTheme,
    RioContainerTheme? containerTheme,
    RioNavigationBarTheme? navigationBarVerticalTheme,
    RioNavigationBarTheme? navigationBarHorizontalTheme,
    Brightness? brightness,
  }) {
    return RioTheme(
      defaultBorderRadius: defaultBorderRadius ?? this.defaultBorderRadius,
      colorScheme: colorScheme ?? this.colorScheme,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      iconButtonTheme: iconButtonTheme ?? this.iconButtonTheme,
      toggleButtonsTheme: toggleButtonsTheme ?? this.toggleButtonsTheme,
      checkboxTheme: checkboxTheme ?? this.checkboxTheme,
      textFieldTheme: textFieldTheme ?? this.textFieldTheme,
      pinFieldTheme: pinFieldTheme ?? this.pinFieldTheme,
      popoverTheme: popoverTheme ?? this.popoverTheme,
      avatarTheme: avatarTheme ?? this.avatarTheme,
      containerTheme: containerTheme ?? this.containerTheme,
      navigationBarVerticalTheme:
          navigationBarVerticalTheme ?? this.navigationBarVerticalTheme,
      navigationBarHorizontalTheme:
          navigationBarHorizontalTheme ?? this.navigationBarHorizontalTheme,
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
      iconButtonTheme:
          iconButtonTheme.lerp(other.iconButtonTheme, t) as RioIconButtonTheme,
      toggleButtonsTheme: toggleButtonsTheme.lerp(other.toggleButtonsTheme, t)
          as RioToggleButtonsTheme,
      checkboxTheme:
          checkboxTheme.lerp(other.checkboxTheme, t) as RioCheckboxTheme,
      textFieldTheme:
          textFieldTheme.lerp(other.textFieldTheme, t) as RioTextFieldTheme,
      pinFieldTheme:
          pinFieldTheme.lerp(other.pinFieldTheme, t) as RioPinFieldTheme,
      popoverTheme: popoverTheme.lerp(other.popoverTheme, t) as RioPopoverTheme,
      avatarTheme: avatarTheme.lerp(other.avatarTheme, t) as RioAvatarTheme,
      containerTheme:
          containerTheme.lerp(other.containerTheme, t) as RioContainerTheme,
      navigationBarVerticalTheme: navigationBarVerticalTheme.lerp(
          other.navigationBarVerticalTheme, t) as RioNavigationBarTheme,
      navigationBarHorizontalTheme: navigationBarHorizontalTheme.lerp(
          other.navigationBarHorizontalTheme, t) as RioNavigationBarTheme,
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
                .equals(iconButtonTheme, other.iconButtonTheme) &&
            const DeepCollectionEquality()
                .equals(toggleButtonsTheme, other.toggleButtonsTheme) &&
            const DeepCollectionEquality()
                .equals(checkboxTheme, other.checkboxTheme) &&
            const DeepCollectionEquality()
                .equals(textFieldTheme, other.textFieldTheme) &&
            const DeepCollectionEquality()
                .equals(pinFieldTheme, other.pinFieldTheme) &&
            const DeepCollectionEquality()
                .equals(popoverTheme, other.popoverTheme) &&
            const DeepCollectionEquality()
                .equals(avatarTheme, other.avatarTheme) &&
            const DeepCollectionEquality()
                .equals(containerTheme, other.containerTheme) &&
            const DeepCollectionEquality().equals(
                navigationBarVerticalTheme, other.navigationBarVerticalTheme) &&
            const DeepCollectionEquality().equals(navigationBarHorizontalTheme,
                other.navigationBarHorizontalTheme) &&
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
      const DeepCollectionEquality().hash(iconButtonTheme),
      const DeepCollectionEquality().hash(toggleButtonsTheme),
      const DeepCollectionEquality().hash(checkboxTheme),
      const DeepCollectionEquality().hash(textFieldTheme),
      const DeepCollectionEquality().hash(pinFieldTheme),
      const DeepCollectionEquality().hash(popoverTheme),
      const DeepCollectionEquality().hash(avatarTheme),
      const DeepCollectionEquality().hash(containerTheme),
      const DeepCollectionEquality().hash(navigationBarVerticalTheme),
      const DeepCollectionEquality().hash(navigationBarHorizontalTheme),
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
      ..add(DiagnosticsProperty('iconButtonTheme', iconButtonTheme))
      ..add(DiagnosticsProperty('toggleButtonsTheme', toggleButtonsTheme))
      ..add(DiagnosticsProperty('checkboxTheme', checkboxTheme))
      ..add(DiagnosticsProperty('textFieldTheme', textFieldTheme))
      ..add(DiagnosticsProperty('pinFieldTheme', pinFieldTheme))
      ..add(DiagnosticsProperty('popoverTheme', popoverTheme))
      ..add(DiagnosticsProperty('avatarTheme', avatarTheme))
      ..add(DiagnosticsProperty('containerTheme', containerTheme))
      ..add(DiagnosticsProperty(
          'navigationBarVerticalTheme', navigationBarVerticalTheme))
      ..add(DiagnosticsProperty(
          'navigationBarHorizontalTheme', navigationBarHorizontalTheme))
      ..add(DiagnosticsProperty('brightness', brightness));
  }
}

extension RioThemeThemeData on ThemeData {
  RioTheme get rioTheme => extension<RioTheme>()!;
}
