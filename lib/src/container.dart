import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:rio/rio.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'container.tailor.dart';

@TailorMixinComponent()
class RioContainerTheme extends ThemeExtension<RioContainerTheme>
    with DiagnosticableTreeMixin, _$RioContainerThemeTailorMixin {
  const RioContainerTheme({
    this.margin,
    this.padding,
    this.blur,
    this.opacity,
    this.borderRadius,
    this.border,
    this.color,
  });

  const RioContainerTheme.defaultTheme()
      : margin = EdgeInsets.zero,
        padding = EdgeInsets.zero,
        blur = 8,
        opacity = 0.5,
        border = null,
        color = null,
        borderRadius = null;

  @override
  final EdgeInsets? margin;
  @override
  final EdgeInsets? padding;
  @override
  final BorderRadiusGeometry? borderRadius;
  @override
  final BoxBorder? border;
  @override
  final Color? color;
  @override
  final double? blur;
  @override
  final double? opacity;

  RioContainerTheme merge(RioContainerTheme? other) {
    return const RioContainerTheme.defaultTheme().copyWith(
      margin: other?.margin ?? margin,
      padding: other?.padding ?? padding,
      blur: other?.blur ?? blur,
      borderRadius: other?.borderRadius ?? borderRadius,
      border: other?.border ?? border,
      color: other?.color ?? color,
      opacity: other?.opacity ?? opacity,
    );
  }
}

class RioContainer extends StatelessWidget {
  const RioContainer({
    super.key,
    this.height,
    this.width,
    this.theme,
    this.child,
  });

  final double? height;
  final double? width;
  final RioContainerTheme? theme;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = RioTheme.of(context).containerTheme.merge(this.theme);
    final color = theme.color ?? RioTheme.of(context).colorScheme.surface;
    final borderColor = RioTheme.of(context).colorScheme.onSurface;

    final borderRadius = theme.borderRadius ??
        BorderRadius.circular(RioTheme.of(context).defaultBorderRadius);

    return Padding(
      padding: theme.margin ?? EdgeInsets.zero,
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        clipBehavior: Clip.antiAlias,
        child: _Blur(
          blur: theme.blur!,
          child: Container(
            height: height,
            width: width,
            padding: theme.padding,
            decoration: BoxDecoration(
              color: color.withValues(alpha: theme.opacity!),
              borderRadius: borderRadius,
            ),
            foregroundDecoration: BoxDecoration(
              borderRadius: borderRadius,
              border: theme.border ??
                  GradientBoxBorder(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.1, 1.0],
                      colors: [
                        RioColorUtils.getSolidColorFromTransparent(
                          RioTheme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: 0.4),
                          RioTheme.of(context).colorScheme.background,
                        ),
                        RioColorUtils.getSolidColorFromTransparent(
                          borderColor.withValues(alpha: 0.2),
                          RioTheme.of(context).colorScheme.background,
                        ),
                      ],
                    ),
                    width: 2,
                  ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _Blur extends StatelessWidget {
  const _Blur({
    required this.child,
    required this.blur,
  });
  final Widget child;
  final double blur;

  @override
  Widget build(BuildContext context) {
    if (blur == 0) {
      return child;
    }

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: blur,
        sigmaY: blur,
      ),
      child: child,
    );
  }
}
