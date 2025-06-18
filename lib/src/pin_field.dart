import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rio/rio.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

export 'package:pin_code_fields/pin_code_fields.dart' show ErrorAnimationType;

part 'pin_field.tailor.dart';

@TailorMixinComponent()
class RioPinFieldTheme extends ThemeExtension<RioPinFieldTheme>
    with DiagnosticableTreeMixin, _$RioPinFieldThemeTailorMixin {
  const RioPinFieldTheme({
    this.margin,
    this.borderRadius,
    this.color,
  });

  const RioPinFieldTheme.defaultTheme()
      : margin = EdgeInsets.zero,
        borderRadius = null,
        color = null;

  @override
  final EdgeInsets? margin;
  @override
  final BorderRadius? borderRadius;
  @override
  final Color? color;

  RioPinFieldTheme merge(RioPinFieldTheme? other) {
    return const RioPinFieldTheme.defaultTheme().copyWith(
      margin: other?.margin ?? margin,
      borderRadius: other?.borderRadius ?? borderRadius,
      color: other?.color ?? color,
    );
  }
}

class RioPinField extends StatelessWidget {
  const RioPinField({
    super.key,
    this.count = 6,
    this.onCompleted,
    this.autoFocus = false,
    this.errorAnimationController,
    this.controller,
    this.obscureText = true,
    this.disabled = false,
    this.theme,
  });
  final int count;
  final ValueChanged<String>? onCompleted;
  final bool autoFocus;
  final StreamController<ErrorAnimationType>? errorAnimationController;
  final TextEditingController? controller;
  final bool obscureText;
  final RioPinFieldTheme? theme;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final theme = RioTheme.of(context).pinFieldTheme.merge(this.theme);
    final color = theme.color ?? RioTheme.of(context).colorScheme.primary;

    final borderRadius = theme.borderRadius ??
        BorderRadius.circular(RioTheme.of(context).defaultBorderRadius);

    final borderColor =
        RioTheme.of(context).colorScheme.onSurface.withValues(alpha: 0.2);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: theme.margin,
      constraints: BoxConstraints(maxWidth: count * 50),
      child: MouseRegion(
        cursor:
            disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.text,
        child: PinCodeTextField(
          controller: controller,
          errorAnimationController: errorAnimationController,
          showCursor: false,
          autoDisposeControllers: false,
          appContext: context,
          scrollPadding: EdgeInsets.zero,
          errorTextMargin: EdgeInsets.zero,
          errorTextSpace: 0,
          enableActiveFill: true,
          autoFocus: autoFocus,
          length: count,
          enabled: !disabled,
          obscureText: obscureText,
          blinkWhenObscuring: true,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            borderWidth: 1,
            shape: PinCodeFieldShape.box,
            borderRadius: borderRadius,
            activeColor: borderColor,
            disabledColor: borderColor,
            activeFillColor: color.withValues(alpha: 0.12),
            inactiveColor: borderColor,
            inactiveFillColor: Colors.transparent,
            selectedColor: color,
            selectedFillColor: color.withValues(alpha: 0.12),
          ),
          onCompleted: onCompleted,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
