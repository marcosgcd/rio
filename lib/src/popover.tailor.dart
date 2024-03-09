// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'popover.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioPopoverThemeTailorMixin
    on ThemeExtension<RioPopoverTheme>, DiagnosticableTreeMixin {
  Color? get backgroundColor;
  Color? get barrierColor;
  EdgeInsets? get padding;
  double? get borderRadius;
  Size? get arrowSize;

  @override
  RioPopoverTheme copyWith({
    Color? backgroundColor,
    Color? barrierColor,
    EdgeInsets? padding,
    double? borderRadius,
    Size? arrowSize,
  }) {
    return RioPopoverTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      barrierColor: barrierColor ?? this.barrierColor,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      arrowSize: arrowSize ?? this.arrowSize,
    );
  }

  @override
  RioPopoverTheme lerp(
      covariant ThemeExtension<RioPopoverTheme>? other, double t) {
    if (other is! RioPopoverTheme) return this as RioPopoverTheme;
    return RioPopoverTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      barrierColor: Color.lerp(barrierColor, other.barrierColor, t),
      padding: t < 0.5 ? padding : other.padding,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      arrowSize: t < 0.5 ? arrowSize : other.arrowSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioPopoverTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(barrierColor, other.barrierColor) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(arrowSize, other.arrowSize));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(barrierColor),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(arrowSize),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioPopoverTheme'))
      ..add(DiagnosticsProperty('backgroundColor', backgroundColor))
      ..add(DiagnosticsProperty('barrierColor', barrierColor))
      ..add(DiagnosticsProperty('padding', padding))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('arrowSize', arrowSize));
  }
}
