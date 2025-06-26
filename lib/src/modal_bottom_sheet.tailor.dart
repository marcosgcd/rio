// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modal_bottom_sheet.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$RioModalThemeTailorMixin
    on ThemeExtension<RioModalTheme>, DiagnosticableTreeMixin {
  RioContainerTheme? get containerTheme;
  Color? get barrierColor;
  EdgeInsets? get padding;
  double? get borderRadius;
  double? get topBorderRadius;
  bool? get showCloseButton;
  RioIconButtonTheme? get closeButtonTheme;
  DismissDirection? get dismissDirection;
  double? get maxHeight;
  bool? get resizeToAvoidBottomInset;
  bool? get barrierDismissible;
  bool? get useSafeArea;

  @override
  RioModalTheme copyWith({
    RioContainerTheme? containerTheme,
    Color? barrierColor,
    EdgeInsets? padding,
    double? borderRadius,
    double? topBorderRadius,
    bool? showCloseButton,
    RioIconButtonTheme? closeButtonTheme,
    DismissDirection? dismissDirection,
    double? maxHeight,
    bool? resizeToAvoidBottomInset,
    bool? barrierDismissible,
    bool? useSafeArea,
  }) {
    return RioModalTheme(
      containerTheme: containerTheme ?? this.containerTheme,
      barrierColor: barrierColor ?? this.barrierColor,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      topBorderRadius: topBorderRadius ?? this.topBorderRadius,
      showCloseButton: showCloseButton ?? this.showCloseButton,
      closeButtonTheme: closeButtonTheme ?? this.closeButtonTheme,
      dismissDirection: dismissDirection ?? this.dismissDirection,
      maxHeight: maxHeight ?? this.maxHeight,
      resizeToAvoidBottomInset:
          resizeToAvoidBottomInset ?? this.resizeToAvoidBottomInset,
      barrierDismissible: barrierDismissible ?? this.barrierDismissible,
      useSafeArea: useSafeArea ?? this.useSafeArea,
    );
  }

  @override
  RioModalTheme lerp(covariant ThemeExtension<RioModalTheme>? other, double t) {
    if (other is! RioModalTheme) return this as RioModalTheme;
    return RioModalTheme(
      containerTheme:
          containerTheme?.lerp(other.containerTheme, t) as RioContainerTheme?,
      barrierColor: Color.lerp(barrierColor, other.barrierColor, t),
      padding: t < 0.5 ? padding : other.padding,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      topBorderRadius: t < 0.5 ? topBorderRadius : other.topBorderRadius,
      showCloseButton: t < 0.5 ? showCloseButton : other.showCloseButton,
      closeButtonTheme: closeButtonTheme?.lerp(other.closeButtonTheme, t)
          as RioIconButtonTheme?,
      dismissDirection: t < 0.5 ? dismissDirection : other.dismissDirection,
      maxHeight: t < 0.5 ? maxHeight : other.maxHeight,
      resizeToAvoidBottomInset:
          t < 0.5 ? resizeToAvoidBottomInset : other.resizeToAvoidBottomInset,
      barrierDismissible:
          t < 0.5 ? barrierDismissible : other.barrierDismissible,
      useSafeArea: t < 0.5 ? useSafeArea : other.useSafeArea,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RioModalTheme &&
            const DeepCollectionEquality()
                .equals(containerTheme, other.containerTheme) &&
            const DeepCollectionEquality()
                .equals(barrierColor, other.barrierColor) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(topBorderRadius, other.topBorderRadius) &&
            const DeepCollectionEquality()
                .equals(showCloseButton, other.showCloseButton) &&
            const DeepCollectionEquality()
                .equals(closeButtonTheme, other.closeButtonTheme) &&
            const DeepCollectionEquality()
                .equals(dismissDirection, other.dismissDirection) &&
            const DeepCollectionEquality().equals(maxHeight, other.maxHeight) &&
            const DeepCollectionEquality().equals(
                resizeToAvoidBottomInset, other.resizeToAvoidBottomInset) &&
            const DeepCollectionEquality()
                .equals(barrierDismissible, other.barrierDismissible) &&
            const DeepCollectionEquality()
                .equals(useSafeArea, other.useSafeArea));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(containerTheme),
      const DeepCollectionEquality().hash(barrierColor),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(topBorderRadius),
      const DeepCollectionEquality().hash(showCloseButton),
      const DeepCollectionEquality().hash(closeButtonTheme),
      const DeepCollectionEquality().hash(dismissDirection),
      const DeepCollectionEquality().hash(maxHeight),
      const DeepCollectionEquality().hash(resizeToAvoidBottomInset),
      const DeepCollectionEquality().hash(barrierDismissible),
      const DeepCollectionEquality().hash(useSafeArea),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioModalTheme'))
      ..add(DiagnosticsProperty('containerTheme', containerTheme))
      ..add(DiagnosticsProperty('barrierColor', barrierColor))
      ..add(DiagnosticsProperty('padding', padding))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('topBorderRadius', topBorderRadius))
      ..add(DiagnosticsProperty('showCloseButton', showCloseButton))
      ..add(DiagnosticsProperty('closeButtonTheme', closeButtonTheme))
      ..add(DiagnosticsProperty('dismissDirection', dismissDirection))
      ..add(DiagnosticsProperty('maxHeight', maxHeight))
      ..add(DiagnosticsProperty(
          'resizeToAvoidBottomInset', resizeToAvoidBottomInset))
      ..add(DiagnosticsProperty('barrierDismissible', barrierDismissible))
      ..add(DiagnosticsProperty('useSafeArea', useSafeArea));
  }
}
