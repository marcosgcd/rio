// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'button.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioButtonThemeTailorMixin
    on ThemeExtension<RioButtonTheme>, DiagnosticableTreeMixin {
  RioButtonVariant? get variant;
  EdgeInsets? get margin;
  EdgeInsets? get padding;
  double? get gap;
  BorderRadiusGeometry? get borderRadius;
  BoxBorder? get border;
  Color? get color;
  bool? get disableScaleAnimation;
  bool? get disableHighlight;
  double? get scaleValue;
  RioButtonIconPosition? get iconPosition;

  @override
  RioButtonTheme copyWith({
    RioButtonVariant? variant,
    EdgeInsets? margin,
    EdgeInsets? padding,
    double? gap,
    BorderRadiusGeometry? borderRadius,
    BoxBorder? border,
    Color? color,
    bool? disableScaleAnimation,
    bool? disableHighlight,
    double? scaleValue,
    RioButtonIconPosition? iconPosition,
  }) {
    return RioButtonTheme(
      variant: variant ?? this.variant,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      gap: gap ?? this.gap,
      borderRadius: borderRadius ?? this.borderRadius,
      border: border ?? this.border,
      color: color ?? this.color,
      disableScaleAnimation:
          disableScaleAnimation ?? this.disableScaleAnimation,
      disableHighlight: disableHighlight ?? this.disableHighlight,
      scaleValue: scaleValue ?? this.scaleValue,
      iconPosition: iconPosition ?? this.iconPosition,
    );
  }

  @override
  RioButtonTheme lerp(
      covariant ThemeExtension<RioButtonTheme>? other, double t) {
    if (other is! RioButtonTheme) return this as RioButtonTheme;
    return RioButtonTheme(
      variant: t < 0.5 ? variant : other.variant,
      margin: t < 0.5 ? margin : other.margin,
      padding: t < 0.5 ? padding : other.padding,
      gap: t < 0.5 ? gap : other.gap,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      border: t < 0.5 ? border : other.border,
      color: Color.lerp(color, other.color, t),
      disableScaleAnimation:
          t < 0.5 ? disableScaleAnimation : other.disableScaleAnimation,
      disableHighlight: t < 0.5 ? disableHighlight : other.disableHighlight,
      scaleValue: t < 0.5 ? scaleValue : other.scaleValue,
      iconPosition: t < 0.5 ? iconPosition : other.iconPosition,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioButtonTheme &&
            const DeepCollectionEquality().equals(variant, other.variant) &&
            const DeepCollectionEquality().equals(margin, other.margin) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality().equals(gap, other.gap) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(border, other.border) &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality()
                .equals(disableScaleAnimation, other.disableScaleAnimation) &&
            const DeepCollectionEquality()
                .equals(disableHighlight, other.disableHighlight) &&
            const DeepCollectionEquality()
                .equals(scaleValue, other.scaleValue) &&
            const DeepCollectionEquality()
                .equals(iconPosition, other.iconPosition));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(variant),
      const DeepCollectionEquality().hash(margin),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(gap),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(border),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(disableScaleAnimation),
      const DeepCollectionEquality().hash(disableHighlight),
      const DeepCollectionEquality().hash(scaleValue),
      const DeepCollectionEquality().hash(iconPosition),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioButtonTheme'))
      ..add(DiagnosticsProperty('variant', variant))
      ..add(DiagnosticsProperty('margin', margin))
      ..add(DiagnosticsProperty('padding', padding))
      ..add(DiagnosticsProperty('gap', gap))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('border', border))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('disableScaleAnimation', disableScaleAnimation))
      ..add(DiagnosticsProperty('disableHighlight', disableHighlight))
      ..add(DiagnosticsProperty('scaleValue', scaleValue))
      ..add(DiagnosticsProperty('iconPosition', iconPosition));
  }
}
