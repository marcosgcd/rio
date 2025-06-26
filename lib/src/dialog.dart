import 'package:flutter/material.dart';
import 'package:rio/rio.dart';

/// {@template custom_rect_tween}
/// Linear RectTween with a [Curves.easeOut] curve.
///
/// Less dramatic that the regular [RectTween] used in [Hero] animations.
/// {@endtemplate}
class CustomRectTween extends RectTween {
  /// {@macro custom_rect_tween}
  CustomRectTween({
    required super.begin,
    required super.end,
  });

  @override
  Rect? lerp(double t) {
    final elasticCurveValue = Curves.easeOut.transform(t);

    return Rect.lerp(begin, end, elasticCurveValue);
  }
}

/// {@template rio_dialog_route}
/// Custom [PageRoute] that creates a center dialog without a built-in close button.
///
/// This is used by RioDialog to avoid double close buttons.
/// {@endtemplate}
class RioDialogRoute<T> extends PageRoute<T> {
  /// {@macro rio_dialog_route}
  RioDialogRoute({
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    bool resizeToAvoidBottomInset = true,
    super.settings,
    super.fullscreenDialog = false,
  })  : _builder = builder,
        _resizeToAvoidBottomInset = resizeToAvoidBottomInset,
        _barrierDismissible = barrierDismissible;

  final WidgetBuilder _builder;
  final bool _barrierDismissible;
  final bool _resizeToAvoidBottomInset;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => _barrierDismissible;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 450);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // fade transition
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: _resizeToAvoidBottomInset,
      body: Stack(
        children: [
          if (barrierDismissible)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  final keyboardOpen =
                      MediaQuery.of(context).viewInsets.bottom > 0;
                  FocusScope.of(context).unfocus();
                  if (!keyboardOpen) {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          Center(
            child: _builder(context),
          ),
        ],
      ),
    );
  }

  @override
  String get barrierLabel => 'Dialog open';
}

/// Configuration class for RioDialog appearance and behavior
class RioDialogTheme {
  const RioDialogTheme({
    this.containerTheme,
    this.padding,
    this.margin,
    this.showCloseButton,
    this.closeButtonTheme,
    this.barrierDismissible,
    this.resizeToAvoidBottomInset,
    this.maxWidth,
    this.maxHeight,
  });

  const RioDialogTheme.defaultTheme()
      : containerTheme = null,
        padding = const EdgeInsets.all(24),
        margin = const EdgeInsets.all(32),
        showCloseButton = true,
        closeButtonTheme = null,
        barrierDismissible = true,
        resizeToAvoidBottomInset = true,
        maxWidth = null,
        maxHeight = null;

  /// Theme for the internal RioContainer that wraps the dialog content.
  /// Use this to customize the dialog's background color, border, shadow, etc.
  ///
  /// Example:
  /// ```dart
  /// RioDialogTheme(
  ///   containerTheme: RioContainerTheme(
  ///     color: Colors.red,
  ///     borderRadius: BorderRadius.circular(20),
  ///     border: Border.all(color: Colors.blue, width: 2),
  ///   ),
  ///   padding: EdgeInsets.all(24), // Space inside the dialog
  ///   margin: EdgeInsets.all(16),  // Space from screen edges
  /// )
  /// ```
  final RioContainerTheme? containerTheme;

  /// Padding inside the dialog container around the content
  final EdgeInsets? padding;

  /// Margin around the dialog container from the screen edges.
  /// This creates space between the dialog and the screen boundaries.
  /// Use this to control how close the dialog can get to screen edges.
  final EdgeInsets? margin;

  /// Whether to show the close button above the dialog
  final bool? showCloseButton;

  /// Theme for the close button
  final RioIconButtonTheme? closeButtonTheme;

  /// Whether tapping outside the dialog dismisses it
  final bool? barrierDismissible;

  /// Whether the dialog should resize to avoid the bottom inset (keyboard)
  final bool? resizeToAvoidBottomInset;

  /// Maximum width of the dialog
  final double? maxWidth;

  /// Maximum height of the dialog
  final double? maxHeight;

  /// Creates a copy of this theme with the given fields replaced by new values
  RioDialogTheme copyWith({
    RioContainerTheme? containerTheme,
    EdgeInsets? padding,
    EdgeInsets? margin,
    bool? showCloseButton,
    RioIconButtonTheme? closeButtonTheme,
    bool? barrierDismissible,
    bool? resizeToAvoidBottomInset,
    double? maxWidth,
    double? maxHeight,
  }) {
    return RioDialogTheme(
      containerTheme: containerTheme ?? this.containerTheme,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      showCloseButton: showCloseButton ?? this.showCloseButton,
      closeButtonTheme: closeButtonTheme ?? this.closeButtonTheme,
      barrierDismissible: barrierDismissible ?? this.barrierDismissible,
      resizeToAvoidBottomInset:
          resizeToAvoidBottomInset ?? this.resizeToAvoidBottomInset,
      maxWidth: maxWidth ?? this.maxWidth,
      maxHeight: maxHeight ?? this.maxHeight,
    );
  }

  /// Merges this theme with another theme, with the other theme taking precedence
  RioDialogTheme merge(RioDialogTheme? other) {
    if (other == null) return this;
    return copyWith(
      containerTheme: other.containerTheme,
      padding: other.padding,
      margin: other.margin,
      showCloseButton: other.showCloseButton,
      closeButtonTheme: other.closeButtonTheme,
      barrierDismissible: other.barrierDismissible,
      resizeToAvoidBottomInset: other.resizeToAvoidBottomInset,
      maxWidth: other.maxWidth,
      maxHeight: other.maxHeight,
    );
  }
}

/// A reusable component that displays content in a dialog
class RioDialog extends StatelessWidget {
  const RioDialog({
    super.key,
    required this.child,
    this.theme,
    this.onDismissed,
  });

  final Widget child;
  final RioDialogTheme? theme;
  final VoidCallback? onDismissed;

  @override
  Widget build(BuildContext context) {
    // Merge with default theme
    final dialogTheme = const RioDialogTheme.defaultTheme().merge(theme);

    final containerTheme = (dialogTheme.containerTheme ??
            RioContainerTheme(
              color: RioTheme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(
                RioTheme.of(context).defaultBorderRadius,
              ),
            ))
        .copyWith(
      // Merge dialog padding into container theme
      padding: dialogTheme.padding ?? const EdgeInsets.all(24),
    );

    final effectiveCloseButtonTheme = dialogTheme.closeButtonTheme ??
        RioIconButtonTheme(
          variant: RioButtonVariant.plain,
          color: RioTheme.of(context).colorScheme.onSurface,
        );

    final constraints = BoxConstraints(
      maxWidth: dialogTheme.maxWidth ?? 400,
      maxHeight:
          dialogTheme.maxHeight ?? MediaQuery.of(context).size.height * 0.8,
    );

    return Container(
      margin: dialogTheme.margin ?? const EdgeInsets.all(16),
      child: Container(
        constraints: constraints,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (dialogTheme.showCloseButton!)
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: RioContainer(
                  theme: RioContainerTheme(
                    borderRadius: effectiveCloseButtonTheme.borderRadius,
                  ),
                  child: RioIconButton(
                    theme: effectiveCloseButtonTheme,
                    onPressed: () {
                      Navigator.pop(context);
                      onDismissed?.call();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
            Flexible(
              child: RioContainer(
                theme: containerTheme,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shows a reusable Rio-styled dialog similar to showRioModal
///
/// This function provides a convenient API for showing dialogs with the Rio design system.
/// It uses the RioDialogRoute internally to support smooth animations.
///
/// The dialog automatically wraps your content in a RioContainer. You can customize this
/// container's appearance using the `theme.containerTheme` property:
/// ```dart
/// showRioDialog(
///   context,
///   theme: RioDialogTheme(
///     containerTheme: RioContainerTheme(
///       color: Colors.blue.shade100,
///       borderRadius: BorderRadius.circular(20),
///       border: Border.all(color: Colors.blue, width: 2),
///     ),
///     padding: EdgeInsets.all(32),
///     margin: EdgeInsets.all(24), // Space from screen edges
///   ),
///   builder: (context) => Column(
///     mainAxisSize: MainAxisSize.min,
///     children: [
///       Text('Custom styled dialog'),
///       RioButton(
///         onPressed: () => Navigator.pop(context),
///         child: Text('Close'),
///       ),
///     ],
///   ),
/// );
/// ```
///
/// For Hero animation support, provide a `heroTag` that matches a Hero widget at the source:
/// ```dart
/// Hero(
///   tag: 'my-hero-tag',
///   child: RioButton(
///     onPressed: () => showRioDialog(
///       context,
///       heroTag: 'my-hero-tag', // Same tag as source Hero
///       builder: (context) => MyDialogContent(),
///     ),
///     child: Text('Open Dialog'),
///   ),
/// )
/// ```
///
/// For simple dialogs without Hero animation:
/// ```dart
/// showRioDialog(
///   context,
///   builder: (context) => Column(
///     mainAxisSize: MainAxisSize.min,
///     children: [
///       Text('Hello World'),
///       RioButton(
///         onPressed: () => Navigator.pop(context),
///         child: Text('Close'),
///       ),
///     ],
///   ),
/// );
/// ```
Future<T?> showRioDialog<T>(
  BuildContext context, {
  required Widget Function(BuildContext context) builder,
  RioDialogTheme? theme,
  VoidCallback? onDismissed,
  Object? heroTag,
  CreateRectTween? createRectTween,
  RouteSettings? routeSettings,
}) async {
  final navigator = Navigator.of(context);
  final dialogTheme = const RioDialogTheme.defaultTheme().merge(theme);

  return navigator.push<T>(
    RioDialogRoute<T>(
      barrierDismissible: dialogTheme.barrierDismissible ?? true,
      resizeToAvoidBottomInset: dialogTheme.resizeToAvoidBottomInset ?? true,
      settings: routeSettings,
      builder: (context) {
        final dialog = RioDialog(
          theme: theme,
          onDismissed: onDismissed,
          child: builder(context),
        );

        // If heroTag is provided, wrap dialog with Hero for animation
        if (heroTag != null) {
          return Hero(
            tag: heroTag,
            createRectTween: createRectTween,
            child: dialog,
          );
        }

        return dialog;
      },
    ),
  );
}
