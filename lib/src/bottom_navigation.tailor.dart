// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_navigation.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioBottomNavigationThemeTailorMixin
    on ThemeExtension<RioBottomNavigationTheme>, DiagnosticableTreeMixin {
  RioContainerTheme? get containerTheme;
  EdgeInsets? get margin;
  EdgeInsets? get padding;
  double? get height;
  BorderRadiusGeometry? get borderRadius;
  Color? get selectedIndicatorColor;
  Duration? get animationDuration;
  RioButtonTheme? get buttonTheme;
  double? get actionButtonSpacing;

  @override
  RioBottomNavigationTheme copyWith({
    RioContainerTheme? containerTheme,
    EdgeInsets? margin,
    EdgeInsets? padding,
    double? height,
    BorderRadiusGeometry? borderRadius,
    Color? selectedIndicatorColor,
    Duration? animationDuration,
    RioButtonTheme? buttonTheme,
    double? actionButtonSpacing,
  }) {
    return RioBottomNavigationTheme(
      containerTheme: containerTheme ?? this.containerTheme,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      height: height ?? this.height,
      borderRadius: borderRadius ?? this.borderRadius,
      selectedIndicatorColor:
          selectedIndicatorColor ?? this.selectedIndicatorColor,
      animationDuration: animationDuration ?? this.animationDuration,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      actionButtonSpacing: actionButtonSpacing ?? this.actionButtonSpacing,
    );
  }

  @override
  RioBottomNavigationTheme lerp(
      covariant ThemeExtension<RioBottomNavigationTheme>? other, double t) {
    if (other is! RioBottomNavigationTheme)
      return this as RioBottomNavigationTheme;
    return RioBottomNavigationTheme(
      containerTheme:
          containerTheme?.lerp(other.containerTheme, t) as RioContainerTheme?,
      margin: t < 0.5 ? margin : other.margin,
      padding: t < 0.5 ? padding : other.padding,
      height: t < 0.5 ? height : other.height,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      selectedIndicatorColor:
          Color.lerp(selectedIndicatorColor, other.selectedIndicatorColor, t),
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      buttonTheme: buttonTheme?.lerp(other.buttonTheme, t) as RioButtonTheme?,
      actionButtonSpacing:
          t < 0.5 ? actionButtonSpacing : other.actionButtonSpacing,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioBottomNavigationTheme &&
            const DeepCollectionEquality()
                .equals(containerTheme, other.containerTheme) &&
            const DeepCollectionEquality().equals(margin, other.margin) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality().equals(height, other.height) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(selectedIndicatorColor, other.selectedIndicatorColor) &&
            const DeepCollectionEquality()
                .equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality()
                .equals(buttonTheme, other.buttonTheme) &&
            const DeepCollectionEquality()
                .equals(actionButtonSpacing, other.actionButtonSpacing));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(containerTheme),
      const DeepCollectionEquality().hash(margin),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(selectedIndicatorColor),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(buttonTheme),
      const DeepCollectionEquality().hash(actionButtonSpacing),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioBottomNavigationTheme'))
      ..add(DiagnosticsProperty('containerTheme', containerTheme))
      ..add(DiagnosticsProperty('margin', margin))
      ..add(DiagnosticsProperty('padding', padding))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(
          DiagnosticsProperty('selectedIndicatorColor', selectedIndicatorColor))
      ..add(DiagnosticsProperty('animationDuration', animationDuration))
      ..add(DiagnosticsProperty('buttonTheme', buttonTheme))
      ..add(DiagnosticsProperty('actionButtonSpacing', actionButtonSpacing));
  }
}
