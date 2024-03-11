import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

class RioIconButtonThemeEncoder extends ThemeEncoder<RioIconButtonTheme> {
  const RioIconButtonThemeEncoder();

  @override
  RioIconButtonTheme lerp(
    RioIconButtonTheme a,
    RioIconButtonTheme b,
    double t,
  ) {
    return a.lerp(b, t);
  }
}

class RioIconButtonTheme extends RioButtonTheme {
  const RioIconButtonTheme({
    super.variant,
    super.margin,
    super.padding,
    super.borderRadius,
    super.border,
    super.color,
    super.disableScaleAnimation,
    super.scaleValue,
  });

  const RioIconButtonTheme.defaultTheme()
      : super(
          padding: const EdgeInsets.all(8),
          scaleValue: 8,
        );

  @override
  RioIconButtonTheme copyWith({
    RioButtonVariant? variant,
    EdgeInsets? margin,
    EdgeInsets? padding,
    double? gap,
    BorderRadiusGeometry? borderRadius,
    BoxBorder? border,
    Color? color,
    bool? disableScaleAnimation,
    double? scaleValue,
    RioButtonIconPosition? iconPosition,
  }) {
    return RioIconButtonTheme(
      variant: variant ?? this.variant,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      border: border ?? this.border,
      color: color ?? this.color,
      disableScaleAnimation:
          disableScaleAnimation ?? this.disableScaleAnimation,
      scaleValue: scaleValue ?? this.scaleValue,
    );
  }

  @override
  RioIconButtonTheme lerp(
    covariant ThemeExtension<RioButtonTheme>? other,
    double t,
  ) {
    if (other is! RioIconButtonTheme) return this;

    return RioIconButtonTheme(
      variant: t < 0.5 ? variant : other.variant,
      margin: t < 0.5 ? margin : other.margin,
      padding: t < 0.5 ? padding : other.padding,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      border: t < 0.5 ? border : other.border,
      color: Color.lerp(color, other.color, t),
      disableScaleAnimation:
          t < 0.5 ? disableScaleAnimation : other.disableScaleAnimation,
      scaleValue: t < 0.5 ? scaleValue : other.scaleValue,
    );
  }
}

class RioIconButton extends StatelessWidget {
  const RioIconButton({
    super.key,
    required this.icon,
    this.disabled = false,
    this.loading = false,
    this.onPressedAwaitMode = RioButtonOnPressedAwaitMode.none,
    this.onPressed,
    this.theme,
  });
  final Widget icon;
  final bool disabled;
  final bool loading;
  final RioButtonOnPressedAwaitMode onPressedAwaitMode;
  final FutureOr<void> Function()? onPressed;

  final RioIconButtonTheme? theme;

  @override
  Widget build(BuildContext context) {
    var theme = RioTheme.of(context).iconButtonTheme.merge(this.theme);

    // Make sure RioIconButton has the same height as RioButton
    theme = theme.copyWith(
      padding: theme.padding!.copyWith(
        top: max(theme.padding!.top - 2.5, 0),
        bottom: max(theme.padding!.bottom - 2.5, 0),
      ),
    );

    return RioButton(
      disabled: disabled,
      loading: loading,
      onPressedAwaitMode: onPressedAwaitMode,
      onPressed: onPressed,
      theme: theme,
      child: icon,
    );
  }
}
