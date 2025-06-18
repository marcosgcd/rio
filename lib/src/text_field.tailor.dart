// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_field.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioTextFieldThemeTailorMixin
    on ThemeExtension<RioTextFieldTheme>, DiagnosticableTreeMixin {
  EdgeInsets? get margin;
  EdgeInsets? get contentPadding;
  BorderRadius? get borderRadius;
  bool? get filled;
  Color? get color;

  @override
  RioTextFieldTheme copyWith({
    EdgeInsets? margin,
    EdgeInsets? contentPadding,
    BorderRadius? borderRadius,
    bool? filled,
    Color? color,
  }) {
    return RioTextFieldTheme(
      margin: margin ?? this.margin,
      contentPadding: contentPadding ?? this.contentPadding,
      borderRadius: borderRadius ?? this.borderRadius,
      filled: filled ?? this.filled,
      color: color ?? this.color,
    );
  }

  @override
  RioTextFieldTheme lerp(
      covariant ThemeExtension<RioTextFieldTheme>? other, double t) {
    if (other is! RioTextFieldTheme) return this as RioTextFieldTheme;
    return RioTextFieldTheme(
      margin: t < 0.5 ? margin : other.margin,
      contentPadding: t < 0.5 ? contentPadding : other.contentPadding,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      filled: t < 0.5 ? filled : other.filled,
      color: Color.lerp(color, other.color, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioTextFieldTheme &&
            const DeepCollectionEquality().equals(margin, other.margin) &&
            const DeepCollectionEquality()
                .equals(contentPadding, other.contentPadding) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(filled, other.filled) &&
            const DeepCollectionEquality().equals(color, other.color));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(margin),
      const DeepCollectionEquality().hash(contentPadding),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(filled),
      const DeepCollectionEquality().hash(color),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioTextFieldTheme'))
      ..add(DiagnosticsProperty('margin', margin))
      ..add(DiagnosticsProperty('contentPadding', contentPadding))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('filled', filled))
      ..add(DiagnosticsProperty('color', color));
  }
}
