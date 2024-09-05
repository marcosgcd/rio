// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'color_scheme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioColorSchemeTailorMixin
    on ThemeExtension<RioColorScheme>, DiagnosticableTreeMixin {
  Brightness get brightness;
  Color get primary;
  Color get onPrimary;
  Color get background;
  Color get onBackground;
  Color get surface;
  Color get onSurface;
  Color get popover;
  Color get onPopover;
  Color get caption;

  @override
  RioColorScheme copyWith({
    Brightness? brightness,
    Color? primary,
    Color? onPrimary,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? popover,
    Color? onPopover,
    Color? caption,
  }) {
    return RioColorScheme(
      brightness: brightness ?? this.brightness,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      popover: popover ?? this.popover,
      onPopover: onPopover ?? this.onPopover,
      caption: caption ?? this.caption,
    );
  }

  @override
  RioColorScheme lerp(
      covariant ThemeExtension<RioColorScheme>? other, double t) {
    if (other is! RioColorScheme) return this as RioColorScheme;
    return RioColorScheme(
      brightness: t < 0.5 ? brightness : other.brightness,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      popover: Color.lerp(popover, other.popover, t)!,
      onPopover: Color.lerp(onPopover, other.onPopover, t)!,
      caption: Color.lerp(caption, other.caption, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioColorScheme &&
            const DeepCollectionEquality()
                .equals(brightness, other.brightness) &&
            const DeepCollectionEquality().equals(primary, other.primary) &&
            const DeepCollectionEquality().equals(onPrimary, other.onPrimary) &&
            const DeepCollectionEquality()
                .equals(background, other.background) &&
            const DeepCollectionEquality()
                .equals(onBackground, other.onBackground) &&
            const DeepCollectionEquality().equals(surface, other.surface) &&
            const DeepCollectionEquality().equals(onSurface, other.onSurface) &&
            const DeepCollectionEquality().equals(popover, other.popover) &&
            const DeepCollectionEquality().equals(onPopover, other.onPopover) &&
            const DeepCollectionEquality().equals(caption, other.caption));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(brightness),
      const DeepCollectionEquality().hash(primary),
      const DeepCollectionEquality().hash(onPrimary),
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(onBackground),
      const DeepCollectionEquality().hash(surface),
      const DeepCollectionEquality().hash(onSurface),
      const DeepCollectionEquality().hash(popover),
      const DeepCollectionEquality().hash(onPopover),
      const DeepCollectionEquality().hash(caption),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioColorScheme'))
      ..add(DiagnosticsProperty('brightness', brightness))
      ..add(DiagnosticsProperty('primary', primary))
      ..add(DiagnosticsProperty('onPrimary', onPrimary))
      ..add(DiagnosticsProperty('background', background))
      ..add(DiagnosticsProperty('onBackground', onBackground))
      ..add(DiagnosticsProperty('surface', surface))
      ..add(DiagnosticsProperty('onSurface', onSurface))
      ..add(DiagnosticsProperty('popover', popover))
      ..add(DiagnosticsProperty('onPopover', onPopover))
      ..add(DiagnosticsProperty('caption', caption));
  }
}
