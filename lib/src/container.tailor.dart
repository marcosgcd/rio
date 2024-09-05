// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'container.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioContainerThemeTailorMixin
    on ThemeExtension<RioContainerTheme>, DiagnosticableTreeMixin {
  EdgeInsets? get margin;
  EdgeInsets? get padding;
  BorderRadiusGeometry? get borderRadius;
  BoxBorder? get border;
  Color? get color;
  double? get blur;
  double? get opacity;

  @override
  RioContainerTheme copyWith({
    EdgeInsets? margin,
    EdgeInsets? padding,
    BorderRadiusGeometry? borderRadius,
    BoxBorder? border,
    Color? color,
    double? blur,
    double? opacity,
  }) {
    return RioContainerTheme(
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      border: border ?? this.border,
      color: color ?? this.color,
      blur: blur ?? this.blur,
      opacity: opacity ?? this.opacity,
    );
  }

  @override
  RioContainerTheme lerp(
      covariant ThemeExtension<RioContainerTheme>? other, double t) {
    if (other is! RioContainerTheme) return this as RioContainerTheme;
    return RioContainerTheme(
      margin: t < 0.5 ? margin : other.margin,
      padding: t < 0.5 ? padding : other.padding,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      border: t < 0.5 ? border : other.border,
      color: Color.lerp(color, other.color, t),
      blur: t < 0.5 ? blur : other.blur,
      opacity: t < 0.5 ? opacity : other.opacity,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioContainerTheme &&
            const DeepCollectionEquality().equals(margin, other.margin) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(border, other.border) &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality().equals(blur, other.blur) &&
            const DeepCollectionEquality().equals(opacity, other.opacity));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(margin),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(border),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(blur),
      const DeepCollectionEquality().hash(opacity),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioContainerTheme'))
      ..add(DiagnosticsProperty('margin', margin))
      ..add(DiagnosticsProperty('padding', padding))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('border', border))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('blur', blur))
      ..add(DiagnosticsProperty('opacity', opacity));
  }
}
