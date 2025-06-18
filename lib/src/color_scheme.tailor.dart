// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  Color get error;
  Color get onError;
  Color get caption;
  Color get border;

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
    Color? error,
    Color? onError,
    Color? caption,
    Color? border,
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
      error: error ?? this.error,
      onError: onError ?? this.onError,
      caption: caption ?? this.caption,
      border: border ?? this.border,
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
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      caption: Color.lerp(caption, other.caption, t)!,
      border: Color.lerp(border, other.border, t)!,
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
            const DeepCollectionEquality().equals(error, other.error) &&
            const DeepCollectionEquality().equals(onError, other.onError) &&
            const DeepCollectionEquality().equals(caption, other.caption) &&
            const DeepCollectionEquality().equals(border, other.border));
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
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(onError),
      const DeepCollectionEquality().hash(caption),
      const DeepCollectionEquality().hash(border),
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
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('onError', onError))
      ..add(DiagnosticsProperty('caption', caption))
      ..add(DiagnosticsProperty('border', border));
  }
}
