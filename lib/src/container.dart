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
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: theme.blur!, sigmaY: theme.blur!),
          child: Container(
            height: height,
            width: width,
            padding: theme.padding,
            decoration: BoxDecoration(
              color: color.withOpacity(theme.opacity!),
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
                        getSolidColorFromTransparent(
                          RioTheme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.4),
                          RioTheme.of(context).colorScheme.background,
                        ),
                        getSolidColorFromTransparent(
                          borderColor.withOpacity(0.2),
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

// TODO: move to separate Package
Color getSolidColorFromTransparent(Color foreground, Color background) {
  // Calculate the effective color without opacity
  final alpha = foreground.opacity; // Foreground opacity
  final inverseAlpha = 1.0 - alpha;

  // Extract the blended color components
  final red = (foreground.red * alpha + background.red * inverseAlpha).round();
  final green =
      (foreground.green * alpha + background.green * inverseAlpha).round();
  final blue =
      (foreground.blue * alpha + background.blue * inverseAlpha).round();

  // Return the resulting color with full opacity
  return Color.fromARGB(255, red, green, blue);
}
