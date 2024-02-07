// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'toolbar.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioToolbarThemeTailorMixin
    on ThemeExtension<RioToolbarTheme>, DiagnosticableTreeMixin {
  EdgeInsets get margin;

  @override
  RioToolbarTheme copyWith({
    EdgeInsets? margin,
  }) {
    return RioToolbarTheme(
      margin: margin ?? this.margin,
    );
  }

  @override
  RioToolbarTheme lerp(
      covariant ThemeExtension<RioToolbarTheme>? other, double t) {
    if (other is! RioToolbarTheme) return this as RioToolbarTheme;
    return RioToolbarTheme(
      margin: t < 0.5 ? margin : other.margin,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioToolbarTheme &&
            const DeepCollectionEquality().equals(margin, other.margin));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(margin),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioToolbarTheme'))
      ..add(DiagnosticsProperty('margin', margin));
  }
}
