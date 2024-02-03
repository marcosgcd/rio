// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'pin_field.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioPinFieldThemeTailorMixin
    on ThemeExtension<RioPinFieldTheme>, DiagnosticableTreeMixin {
  EdgeInsets get margin;
  BorderRadius? get borderRadius;
  Color? get color;

  @override
  RioPinFieldTheme copyWith({
    EdgeInsets? margin,
    BorderRadius? borderRadius,
    Color? color,
  }) {
    return RioPinFieldTheme(
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
      color: color ?? this.color,
    );
  }

  @override
  RioPinFieldTheme lerp(
      covariant ThemeExtension<RioPinFieldTheme>? other, double t) {
    if (other is! RioPinFieldTheme) return this as RioPinFieldTheme;
    return RioPinFieldTheme(
      margin: t < 0.5 ? margin : other.margin,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      color: Color.lerp(color, other.color, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioPinFieldTheme &&
            const DeepCollectionEquality().equals(margin, other.margin) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(color, other.color));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(margin),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(color),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioPinFieldTheme'))
      ..add(DiagnosticsProperty('margin', margin))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('color', color));
  }
}
