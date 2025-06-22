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

/// Configuration for action buttons in the bottom navigation
///
/// You can either provide an [onPressed] callback for simple actions,
/// or use [dialogBuilder] for easy Hero-animated dialogs.
///
/// Example with dialog builder and Hero animation:
/// ```dart
/// RioBottomNavigationAction(
///   heroTag: 'my-action',
///   createRectTween: (begin, end) => CustomRectTween(begin: begin, end: end),
///   dialogBuilder: (context) => MyDialogContent(),
///   child: Icon(Icons.add),
/// )
/// ```
class RioBottomNavigationAction {
  const RioBottomNavigationAction({
    this.onPressed,
    this.child,
    this.tooltip,
    this.buttonTheme,
    this.containerTheme,
    this.heroTag,
    this.createRectTween,
    this.dialogBuilder,
  }) : assert(
          onPressed != null || dialogBuilder != null,
          'Either onPressed or dialogBuilder must be provided',
        );

  /// Custom action callback. Use this for simple actions.
  /// If [dialogBuilder] is provided, this is ignored.
  final void Function(BuildContext context)? onPressed;

  /// Child widget displayed in the action button, defaults to [Icons.add]
  final Widget? child;

  /// Tooltip text for the action button
  final String? tooltip;

  /// Custom button theme, defaults to [RioButtonVariant.soft]
  final RioButtonTheme? buttonTheme;

  /// Custom container theme for wrapping the button
  final RioContainerTheme? containerTheme;

  /// Hero tag for Hero animations. Required when using [dialogBuilder] with Hero animation.
  final Object? heroTag;

  /// Custom rect tween for Hero animations. Only used when [heroTag] is provided.
  final CreateRectTween? createRectTween;

  /// Builder for dialog content. When provided, tapping the action button will show
  /// a dialog with this content. If [heroTag] is also provided, the dialog will
  /// animate with Hero animation from the action button.
  final Widget Function(BuildContext context)? dialogBuilder;
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
                    ? IgnorePointer(
                        ignoring: !actionVisible,
                        child: _buildActionButton(action, actionVisible),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    RioBottomNavigationAction? action,
    bool actionVisible,
  ) {
    final currentAction = actionVisible ? action! : _lastVisibleAction!;

    final actionContainer = RioContainer(
      theme: currentAction.containerTheme,
      child: Builder(
        builder: (context) {
          return RioButton(
            tooltip: actionVisible ? action?.tooltip : null,
            theme: const RioButtonTheme(
              variant: RioButtonVariant.soft,
            ).merge(currentAction.buttonTheme),
            onPressed: () => _handleActionPressed(context, currentAction),
            child: currentAction.child ?? const Icon(Icons.add),
          );
        },
      ),
    );

    // If no heroTag is provided, return the action button without Hero
    if (currentAction.heroTag == null) {
      return actionContainer;
    }

    // Wrap with Hero if heroTag is provided
    return Hero(
      tag: currentAction.heroTag!,
      createRectTween: currentAction.createRectTween,
      child: actionContainer,
    );
  }

  void _handleActionPressed(
    BuildContext context,
    RioBottomNavigationAction action,
  ) {
    if (action.dialogBuilder != null) {
      // Show dialog with Hero animation if heroTag is provided
      if (action.heroTag != null) {
        showHeroDialog(
          context: context,
          builder: (context) => Hero(
            tag: action.heroTag!,
            createRectTween: action.createRectTween,
            child: action.dialogBuilder!(context),
          ),
        );
      } else {
        // Show regular dialog
        showDialog(
          context: context,
          builder: (context) => Center(
            child: action.dialogBuilder!(context),
          ),
        );
      }
    } else if (action.onPressed != null) {
      action.onPressed!(context);
    }
  }
}
