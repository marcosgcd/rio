import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
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
  })  : margin = null,
        padding = null,
        borderRadius = null,
        border = null,
        color = null,
        opacity = 0.5,
        blur = 5,
        borderWidth = 1,
        disableGlassEffect = false,
        _mode = _RioContainerMode.themed;

  const RioContainer.glass({
    super.key,
    this.theme,
    this.child,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.borderRadius,
    this.border,
    this.color,
    this.opacity = 0.5,
    this.blur = 5,
    this.borderWidth = 1,
    this.disableGlassEffect = false,
  }) : _mode = _RioContainerMode.glass;

  final double? height;
  final double? width;
  final RioContainerTheme? theme;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Color? color;
  final double opacity;
  final double blur;
  final double borderWidth;
  final bool disableGlassEffect;
  final _RioContainerMode _mode;

  @override
  Widget build(BuildContext context) {
    if (_mode == _RioContainerMode.glass) {
      return _buildGlass(context);
    }

    return _buildThemed(context);
  }

  Widget _buildThemed(BuildContext context) {
    final resolvedTheme = RioTheme.of(context).containerTheme.merge(theme);
    final resolvedColor =
        resolvedTheme.color ?? RioTheme.of(context).colorScheme.surface;
    final borderColor = RioTheme.of(context).colorScheme.onSurface;

    final resolvedBorderRadius = resolvedTheme.borderRadius ??
        BorderRadius.circular(RioTheme.of(context).defaultBorderRadius);

    return Padding(
      padding: resolvedTheme.margin ?? EdgeInsets.zero,
      child: Material(
        color: Colors.transparent,
        borderRadius: resolvedBorderRadius,
        clipBehavior: Clip.antiAlias,
        child: _Blur(
          blur: resolvedTheme.blur!,
          child: Container(
            height: height,
            width: width,
            padding: resolvedTheme.padding,
            decoration: BoxDecoration(
              color: resolvedColor.withValues(alpha: resolvedTheme.opacity!),
              borderRadius: resolvedBorderRadius,
            ),
            foregroundDecoration: BoxDecoration(
              borderRadius: resolvedBorderRadius,
              border: resolvedTheme.border ??
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

  Widget _buildGlass(BuildContext context) {
    final resolvedTheme = theme;
    final defaultBorderRadius =
        BorderRadius.circular(RioTheme.of(context).defaultBorderRadius);
    final resolvedBorderRadius =
        borderRadius ?? resolvedTheme?.borderRadius ?? defaultBorderRadius;
    final resolvedColor = color ??
        resolvedTheme?.color ??
        RioTheme.of(context).colorScheme.surface;
    final resolvedMargin = margin ?? resolvedTheme?.margin;
    final resolvedPadding =
        padding ?? resolvedTheme?.padding ?? EdgeInsets.zero;
    final resolvedOpacity = resolvedTheme?.opacity ?? opacity;
    final resolvedBlur = resolvedTheme?.blur ?? blur;
    final resolvedBorder = border ??
        resolvedTheme?.border ??
        Border.all(color: resolvedColor, width: borderWidth);

    final content = disableGlassEffect
        ? Container(
            padding: resolvedPadding,
            color: resolvedColor.withValues(alpha: resolvedOpacity),
            child: child ?? const SizedBox(),
          )
        : ClipRect(
            child: _Blur(
              blur: resolvedBlur,
              child: Container(
                padding: resolvedPadding,
                color: resolvedColor.withValues(alpha: resolvedOpacity),
                child: child ?? const SizedBox(),
              ),
            ),
          );

    return Container(
      margin: resolvedMargin,
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: resolvedBorderRadius,
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: resolvedBorderRadius,
        border: resolvedBorder,
      ),
      child: content,
    );
  }
}

enum _RioContainerMode { themed, glass }

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
