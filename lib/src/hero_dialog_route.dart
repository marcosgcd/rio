import 'package:flutter/material.dart';
import 'package:rio/rio.dart';

/// {@template hero_dialog_route}
/// Custom [PageRoute] that creates an overlay dialog (popup effect).
///
/// Best used with a [Hero] animation.
/// {@endtemplate}
class HeroDialogRoute<T> extends PageRoute<T> {
  /// {@macro hero_dialog_route}
  HeroDialogRoute({
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
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: RioContainer(
                      theme: RioContainerTheme(
                        color: RioTheme.of(context).colorScheme.surface,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: RioIconButton(
                        theme: RioIconButtonTheme(
                          variant: RioButtonVariant.plain,
                          color: RioTheme.of(context).colorScheme.onSurface,
                        ),
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ),
                  _builder(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}

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

/// Helper function to show a Hero dialog
/// This should be used with Hero widgets that have matching tags
Future<T?> showHeroDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  bool resizeToAvoidBottomInset = true,
  RouteSettings? routeSettings,
}) {
  return Navigator.of(context).push<T>(
    HeroDialogRoute<T>(
      builder: builder,
      barrierDismissible: barrierDismissible,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      settings: routeSettings,
    ),
  );
}
