import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'bottom_navigation.tailor.dart';

@TailorMixinComponent()
class RioBottomNavigationTheme extends ThemeExtension<RioBottomNavigationTheme>
    with DiagnosticableTreeMixin, _$RioBottomNavigationThemeTailorMixin {
  const RioBottomNavigationTheme({
    this.containerTheme,
    this.margin,
    this.padding,
    this.height,
    this.borderRadius,
    this.selectedIndicatorColor,
    this.animationDuration,
    this.buttonTheme,
    this.actionButtonSpacing,
  });

  const RioBottomNavigationTheme.defaultTheme()
      : containerTheme = null,
        margin = const EdgeInsets.only(bottom: 8),
        padding = const EdgeInsets.symmetric(horizontal: 8),
        height = 55,
        borderRadius = null,
        selectedIndicatorColor = null,
        animationDuration = const Duration(milliseconds: 200),
        buttonTheme = null,
        actionButtonSpacing = 8;

  @override
  final RioContainerTheme? containerTheme;
  @override
  final EdgeInsets? margin;
  @override
  final EdgeInsets? padding;
  @override
  final double? height;
  @override
  final BorderRadiusGeometry? borderRadius;
  @override
  final Color? selectedIndicatorColor;
  @override
  final Duration? animationDuration;
  @override
  final RioButtonTheme? buttonTheme;
  @override
  final double? actionButtonSpacing;

  RioBottomNavigationTheme merge(RioBottomNavigationTheme? other) {
    return copyWith(
      containerTheme: other?.containerTheme ?? containerTheme,
      margin: other?.margin ?? margin,
      padding: other?.padding ?? padding,
      height: other?.height ?? height,
      borderRadius: other?.borderRadius ?? borderRadius,
      selectedIndicatorColor:
          other?.selectedIndicatorColor ?? selectedIndicatorColor,
      animationDuration: other?.animationDuration ?? animationDuration,
      buttonTheme: other?.buttonTheme ?? buttonTheme,
      actionButtonSpacing: other?.actionButtonSpacing ?? actionButtonSpacing,
    );
  }
}

class RioBottomNavigationItem {
  const RioBottomNavigationItem({
    required this.label,
    required this.icon,
    this.tooltip,
  });

  final String label;
  final Widget icon;
  final String? tooltip;
}

class RioBottomNavigationAction {
  const RioBottomNavigationAction({
    required this.onPressed,
    this.child,
    this.tooltip,
    this.buttonTheme,
    this.containerTheme,
  });

  final void Function(BuildContext context) onPressed;
  final Widget? child;
  final String? tooltip;
  final RioButtonTheme? buttonTheme;
  final RioContainerTheme? containerTheme;
}

class RioBottomNavigation extends StatefulWidget {
  const RioBottomNavigation({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.theme,
    this.actionBuilder,
  });

  final List<RioBottomNavigationItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final RioBottomNavigationTheme? theme;
  final RioBottomNavigationAction? Function(BuildContext context, int index)?
      actionBuilder;

  @override
  State<RioBottomNavigation> createState() => _RioBottomNavigationState();
}

class _RioBottomNavigationState extends State<RioBottomNavigation> {
  RioBottomNavigationAction? _lastVisibleAction;

  @override
  Widget build(BuildContext context) {
    final theme =
        RioTheme.of(context).bottomNavigationTheme.merge(widget.theme);

    final containerTheme = theme.containerTheme ??
        RioTheme.of(context).containerTheme.copyWith(
              color: RioTheme.of(context).colorScheme.surface,
            );

    final buttonTheme = theme.buttonTheme ??
        const RioButtonTheme(
          padding: EdgeInsets.symmetric(horizontal: 24),
          variant: RioButtonVariant.plain,
          disableHighlight: true,
        );

    final selectedIndicatorColor = theme.selectedIndicatorColor ??
        RioTheme.of(context).colorScheme.primary.withValues(alpha: 0.12);

    final action = widget.actionBuilder?.call(context, widget.currentIndex);
    final actionVisible = action != null;

    // Keep track of the last visible action to maintain widget tree stability
    if (action != null) {
      _lastVisibleAction = action;
    }

    final navigationItems = widget.items.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;

      return Expanded(
        child: RioButton(
          key: ValueKey(index),
          theme: buttonTheme,
          tooltip: item.tooltip,
          onPressed: () => widget.onTap(index),
          child: item.icon,
        ),
      );
    }).toList();

    return SafeArea(
      top: false,
      minimum: theme.margin!,
      child: SizedBox(
        height: theme.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: theme.padding!,
                child: RioContainer(
                  theme: containerTheme,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      var position = widget.currentIndex *
                          constraints.maxWidth /
                          widget.items.length;

                      // Adjust position for edge items to prevent overflow
                      if (widget.currentIndex == 0) {
                        position = position + 1;
                      } else if (widget.currentIndex ==
                          widget.items.length - 1) {
                        position = position - 1;
                      }

                      return Stack(
                        children: [
                          // Selected indicator
                          AnimatedPositioned(
                            duration: theme.animationDuration!,
                            left: position,
                            top: 1,
                            bottom: 1,
                            child: RioContainer(
                              theme: containerTheme.copyWith(
                                color: selectedIndicatorColor,
                                opacity: 0.12,
                              ),
                              width: constraints.maxWidth / widget.items.length,
                            ),
                          ),
                          // Navigation items
                          Positioned.fill(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: navigationItems,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            // Action button with animation
            AnimatedOpacity(
              duration: theme.animationDuration!,
              opacity: actionVisible ? 1 : 0,
              child: AnimatedContainer(
                width: actionVisible ? 61 : 0,
                duration: theme.animationDuration!,
                padding: EdgeInsets.only(
                  right: actionVisible ? theme.actionButtonSpacing! : 0,
                ),
                child: _lastVisibleAction != null
                    ? RioContainer(
                        theme: actionVisible
                            ? action.containerTheme
                            : _lastVisibleAction!.containerTheme,
                        child: Builder(
                          builder: (context) {
                            return RioButton(
                              tooltip: actionVisible ? action.tooltip : null,
                              theme: const RioButtonTheme(
                                variant: RioButtonVariant.soft,
                              ).merge(
                                (actionVisible
                                    ? action.buttonTheme
                                    : _lastVisibleAction!.buttonTheme),
                              ),
                              onPressed: () {
                                if (actionVisible) {
                                  action.onPressed(context);
                                } else {
                                  _lastVisibleAction!.onPressed(context);
                                }
                              },
                              child: actionVisible
                                  ? (action.child ?? const Icon(Icons.add))
                                  : (_lastVisibleAction!.child ??
                                      const Icon(Icons.add)),
                            );
                          },
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
