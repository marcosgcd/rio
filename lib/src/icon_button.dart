import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rio/rio.dart';

class RioIconButtonTheme extends RioButtonTheme {
  const RioIconButtonTheme({
    super.variant,
    super.margin,
    super.padding = const EdgeInsets.all(8),
    super.borderRadius,
    super.border,
    super.color,
    super.disableScaleAnimation,
    super.scaleValue = 8,
  });

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
    var theme = this.theme ?? RioTheme.of(context).iconButtonTheme;

    // Make sure RioIconButton has the same height as RioButton
    theme = theme.copyWith(
      padding: theme.padding.copyWith(
        top: max(theme.padding.top - 2.5, 0),
        bottom: max(theme.padding.bottom - 2.5, 0),
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
