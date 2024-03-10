// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'bottom_navigation.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioBottomNavigationThemeTailorMixin
    on ThemeExtension<RioBottomNavigationTheme>, DiagnosticableTreeMixin {
  RioBottomNavigationVariant? get variant;
  EdgeInsets? get margin;
  EdgeInsets? get padding;
  Radius? get radius;
  Color? get backgroundColor;
  bool? get blurBackgroundEffect;

  @override
  RioBottomNavigationTheme copyWith({
    RioBottomNavigationVariant? variant,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Radius? radius,
    Color? backgroundColor,
    bool? blurBackgroundEffect,
  }) {
    return RioBottomNavigationTheme(
      variant: variant ?? this.variant,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      radius: radius ?? this.radius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      blurBackgroundEffect: blurBackgroundEffect ?? this.blurBackgroundEffect,
    );
  }

  @override
  RioBottomNavigationTheme lerp(
      covariant ThemeExtension<RioBottomNavigationTheme>? other, double t) {
    if (other is! RioBottomNavigationTheme)
      return this as RioBottomNavigationTheme;
    return RioBottomNavigationTheme(
      variant: t < 0.5 ? variant : other.variant,
      margin: t < 0.5 ? margin : other.margin,
      padding: t < 0.5 ? padding : other.padding,
      radius: t < 0.5 ? radius : other.radius,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      blurBackgroundEffect:
          t < 0.5 ? blurBackgroundEffect : other.blurBackgroundEffect,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioBottomNavigationTheme &&
            const DeepCollectionEquality().equals(variant, other.variant) &&
            const DeepCollectionEquality().equals(margin, other.margin) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality().equals(radius, other.radius) &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(blurBackgroundEffect, other.blurBackgroundEffect));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(variant),
      const DeepCollectionEquality().hash(margin),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(radius),
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(blurBackgroundEffect),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioBottomNavigationTheme'))
      ..add(DiagnosticsProperty('variant', variant))
      ..add(DiagnosticsProperty('margin', margin))
      ..add(DiagnosticsProperty('padding', padding))
      ..add(DiagnosticsProperty('radius', radius))
      ..add(DiagnosticsProperty('backgroundColor', backgroundColor))
      ..add(DiagnosticsProperty('blurBackgroundEffect', blurBackgroundEffect));
  }
}
