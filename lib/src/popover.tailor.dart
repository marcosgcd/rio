// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'popover.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioPopoverThemeTailorMixin
    on ThemeExtension<RioPopoverTheme>, DiagnosticableTreeMixin {
  RioContainerTheme? get containerTheme;
  Color? get barrierColor;
  EdgeInsets? get padding;
  double? get borderRadius;

  @override
  RioPopoverTheme copyWith({
    RioContainerTheme? containerTheme,
    Color? barrierColor,
    EdgeInsets? padding,
    double? borderRadius,
  }) {
    return RioPopoverTheme(
      containerTheme: containerTheme ?? this.containerTheme,
      barrierColor: barrierColor ?? this.barrierColor,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  RioPopoverTheme lerp(
      covariant ThemeExtension<RioPopoverTheme>? other, double t) {
    if (other is! RioPopoverTheme) return this as RioPopoverTheme;
    return RioPopoverTheme(
      containerTheme:
          containerTheme?.lerp(other.containerTheme, t) as RioContainerTheme?,
      barrierColor: Color.lerp(barrierColor, other.barrierColor, t),
      padding: t < 0.5 ? padding : other.padding,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioPopoverTheme &&
            const DeepCollectionEquality()
                .equals(containerTheme, other.containerTheme) &&
            const DeepCollectionEquality()
                .equals(barrierColor, other.barrierColor) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(containerTheme),
      const DeepCollectionEquality().hash(barrierColor),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(borderRadius),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioPopoverTheme'))
      ..add(DiagnosticsProperty('containerTheme', containerTheme))
      ..add(DiagnosticsProperty('barrierColor', barrierColor))
      ..add(DiagnosticsProperty('padding', padding))
      ..add(DiagnosticsProperty('borderRadius', borderRadius));
  }
}
