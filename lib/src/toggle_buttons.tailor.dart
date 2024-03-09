// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'toggle_buttons.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioToggleButtonsThemeTailorMixin
    on ThemeExtension<RioToggleButtonsTheme>, DiagnosticableTreeMixin {
  EdgeInsets? get margin;
  BorderRadius? get borderRadius;
  BorderSide? get borderSide;
  Color? get color;
  Color? get selectedColor;

  @override
  RioToggleButtonsTheme copyWith({
    EdgeInsets? margin,
    BorderRadius? borderRadius,
    BorderSide? borderSide,
    Color? color,
    Color? selectedColor,
  }) {
    return RioToggleButtonsTheme(
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
      borderSide: borderSide ?? this.borderSide,
      color: color ?? this.color,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }

  @override
  RioToggleButtonsTheme lerp(
      covariant ThemeExtension<RioToggleButtonsTheme>? other, double t) {
    if (other is! RioToggleButtonsTheme) return this as RioToggleButtonsTheme;
    return RioToggleButtonsTheme(
      margin: t < 0.5 ? margin : other.margin,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      borderSide: t < 0.5 ? borderSide : other.borderSide,
      color: Color.lerp(color, other.color, t),
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioToggleButtonsTheme &&
            const DeepCollectionEquality().equals(margin, other.margin) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(borderSide, other.borderSide) &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality()
                .equals(selectedColor, other.selectedColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(margin),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(borderSide),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(selectedColor),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioToggleButtonsTheme'))
      ..add(DiagnosticsProperty('margin', margin))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('borderSide', borderSide))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('selectedColor', selectedColor));
  }
}
