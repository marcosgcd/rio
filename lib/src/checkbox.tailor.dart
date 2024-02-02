// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'checkbox.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioCheckboxThemeTailorMixin
    on ThemeExtension<RioCheckboxTheme>, DiagnosticableTreeMixin {
  EdgeInsets get margin;
  double get gap;
  BorderRadiusGeometry? get borderRadius;
  Color? get color;

  @override
  RioCheckboxTheme copyWith({
    EdgeInsets? margin,
    double? gap,
    BorderRadiusGeometry? borderRadius,
    Color? color,
  }) {
    return RioCheckboxTheme(
      margin: margin ?? this.margin,
      gap: gap ?? this.gap,
      borderRadius: borderRadius ?? this.borderRadius,
      color: color ?? this.color,
    );
  }

  @override
  RioCheckboxTheme lerp(
      covariant ThemeExtension<RioCheckboxTheme>? other, double t) {
    if (other is! RioCheckboxTheme) return this as RioCheckboxTheme;
    return RioCheckboxTheme(
      margin: t < 0.5 ? margin : other.margin,
      gap: t < 0.5 ? gap : other.gap,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      color: Color.lerp(color, other.color, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioCheckboxTheme &&
            const DeepCollectionEquality().equals(margin, other.margin) &&
            const DeepCollectionEquality().equals(gap, other.gap) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(color, other.color));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(margin),
      const DeepCollectionEquality().hash(gap),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(color),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioCheckboxTheme'))
      ..add(DiagnosticsProperty('margin', margin))
      ..add(DiagnosticsProperty('gap', gap))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('color', color));
  }
}
