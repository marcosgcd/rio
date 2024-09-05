// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'navigation_bar.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioNavigationBarThemeTailorMixin
    on ThemeExtension<RioNavigationBarTheme>, DiagnosticableTreeMixin {
  double? get size;
  EdgeInsets? get margin;
  EdgeInsets? get padding;
  double? get gap;
  BorderRadiusGeometry? get borderRadius;
  BoxBorder? get border;
  Color? get color;
  double? get itemIconSize;
  TextStyle? get itemTextStyle;

  @override
  RioNavigationBarTheme copyWith({
    double? size,
    EdgeInsets? margin,
    EdgeInsets? padding,
    double? gap,
    BorderRadiusGeometry? borderRadius,
    BoxBorder? border,
    Color? color,
    double? itemIconSize,
    TextStyle? itemTextStyle,
  }) {
    return RioNavigationBarTheme(
      size: size ?? this.size,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      gap: gap ?? this.gap,
      borderRadius: borderRadius ?? this.borderRadius,
      border: border ?? this.border,
      color: color ?? this.color,
      itemIconSize: itemIconSize ?? this.itemIconSize,
      itemTextStyle: itemTextStyle ?? this.itemTextStyle,
    );
  }

  @override
  RioNavigationBarTheme lerp(
      covariant ThemeExtension<RioNavigationBarTheme>? other, double t) {
    if (other is! RioNavigationBarTheme) return this as RioNavigationBarTheme;
    return RioNavigationBarTheme(
      size: t < 0.5 ? size : other.size,
      margin: t < 0.5 ? margin : other.margin,
      padding: t < 0.5 ? padding : other.padding,
      gap: t < 0.5 ? gap : other.gap,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      border: t < 0.5 ? border : other.border,
      color: Color.lerp(color, other.color, t),
      itemIconSize: t < 0.5 ? itemIconSize : other.itemIconSize,
      itemTextStyle: TextStyle.lerp(itemTextStyle, other.itemTextStyle, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioNavigationBarTheme &&
            const DeepCollectionEquality().equals(size, other.size) &&
            const DeepCollectionEquality().equals(margin, other.margin) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality().equals(gap, other.gap) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(border, other.border) &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality()
                .equals(itemIconSize, other.itemIconSize) &&
            const DeepCollectionEquality()
                .equals(itemTextStyle, other.itemTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(margin),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(gap),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(border),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(itemIconSize),
      const DeepCollectionEquality().hash(itemTextStyle),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioNavigationBarTheme'))
      ..add(DiagnosticsProperty('size', size))
      ..add(DiagnosticsProperty('margin', margin))
      ..add(DiagnosticsProperty('padding', padding))
      ..add(DiagnosticsProperty('gap', gap))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('border', border))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('itemIconSize', itemIconSize))
      ..add(DiagnosticsProperty('itemTextStyle', itemTextStyle));
  }
}
