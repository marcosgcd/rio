import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:rio/rio.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'bottom_navigation.tailor.dart';
part 'bottom_navigation.freezed.dart';

@TailorMixinComponent()
class RioBottomNavigationTheme extends ThemeExtension<RioBottomNavigationTheme>
    with DiagnosticableTreeMixin, _$RioBottomNavigationThemeTailorMixin {
  const RioBottomNavigationTheme({
    this.variant,
    this.margin,
    this.padding,
    this.radius,
    this.backgroundColor,
    this.blurBackgroundEffect,
  });

  const RioBottomNavigationTheme.defaultTheme()
      : variant = RioBottomNavigationVariant.fixed,
        margin = const EdgeInsets.all(8),
        padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        blurBackgroundEffect = true,
        radius = null,
        backgroundColor = null;

  @override
  final RioBottomNavigationVariant? variant;
  @override
  final EdgeInsets? margin;
  @override
  final EdgeInsets? padding;
  @override
  final Radius? radius;
  @override
  final Color? backgroundColor;
  @override
  final bool? blurBackgroundEffect;

  RioBottomNavigationTheme merge(RioBottomNavigationTheme? other) {
    return const RioBottomNavigationTheme.defaultTheme().copyWith(
      variant: other?.variant ?? variant,
      margin: other?.margin ?? margin,
      padding: other?.padding ?? padding,
      radius: other?.radius ?? radius,
      backgroundColor: other?.backgroundColor ?? backgroundColor,
    );
  }
}

@freezed
class RioNavigationItem with _$RioNavigationItem {
  factory RioNavigationItem({
    required String label,
    required Widget icon,
  }) = _RioNavigationItem;
}

enum RioBottomNavigationVariant {
  fixed,
  floating,
}

class RioBottomNavigation extends StatelessWidget {
  const RioBottomNavigation({
    super.key,
    required this.items,
    this.theme,
    required this.currentIndex,
    required this.onChange,
  });
  final RioBottomNavigationTheme? theme;
  final List<RioNavigationItem> items;
  final int currentIndex;
  final ValueChanged<int> onChange;

  @override
  Widget build(BuildContext context) {
    final theme = RioTheme.of(context).bottomNavigationTheme.merge(this.theme);
    final borderRadius = theme.radius ??
        Radius.circular(RioTheme.of(context).defaultBorderRadius);
    Color backgroundColor =
        theme.backgroundColor ?? RioTheme.of(context).colorScheme.surface;

    if (theme.blurBackgroundEffect == true) {
      backgroundColor = backgroundColor.withOpacity(0.5);
    }

    final navigatonItems = items.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      final selected = currentIndex == index;
      return RioButton(
        theme: RioButtonTheme(
          variant: selected ? RioButtonVariant.soft : RioButtonVariant.plain,
        ),
        onPressed: () => onChange(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            item.icon,
            Text(item.label),
          ],
        ),
      );
    }).toList();

    if (theme.variant == RioBottomNavigationVariant.floating) {
      return SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              margin: theme.margin,
              padding: theme.padding,
              constraints: const BoxConstraints(
                maxWidth: 500,
                minWidth: 300,
              ),
              duration: const Duration(milliseconds: 300),
              child: GlassContainer(
                color: backgroundColor,
                blur: 4,
                borderRadius: BorderRadius.all(borderRadius),
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 300),
                  padding: theme.padding!,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: navigatonItems,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return GlassContainer(
      color: backgroundColor,
      blur: 4,
      borderRadius: BorderRadius.only(
        topLeft: borderRadius,
        topRight: borderRadius,
      ),
      child: SafeArea(
        top: false,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          padding: theme.padding!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: navigatonItems,
          ),
        ),
      ),
    );
  }
}
