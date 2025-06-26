import 'package:flutter/cupertino.dart' show kCupertinoModalBarrierColor;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:rio/rio.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'modal_bottom_sheet.tailor.dart';

@TailorMixinComponent()
class RioModalTheme extends ThemeExtension<RioModalTheme>
    with DiagnosticableTreeMixin, _$RioModalThemeTailorMixin {
  const RioModalTheme({
    this.containerTheme,
    this.barrierColor,
    this.padding,
    this.borderRadius,
    this.topBorderRadius,
    this.showCloseButton,
    this.closeButtonTheme,
    this.dismissDirection,
    this.maxHeight,
    this.resizeToAvoidBottomInset,
    this.barrierDismissible,
    this.useSafeArea,
  });

  const RioModalTheme.defaultTheme()
      : containerTheme = null,
        barrierColor = null,
        padding = const EdgeInsets.fromLTRB(16, 16, 16, 0),
        borderRadius = null,
        topBorderRadius = null,
        showCloseButton = true,
        closeButtonTheme = null,
        dismissDirection = DismissDirection.down,
        maxHeight = null,
        resizeToAvoidBottomInset = false,
        barrierDismissible = true,
        useSafeArea = true;

  @override
  final RioContainerTheme? containerTheme;
  @override
  final Color? barrierColor;
  @override
  final EdgeInsets? padding;
  @override
  final double? borderRadius;
  @override
  final double? topBorderRadius;
  @override
  final bool? showCloseButton;
  @override
  final RioIconButtonTheme? closeButtonTheme;
  @override
  final DismissDirection? dismissDirection;
  @override
  final double? maxHeight;
  @override
  final bool? resizeToAvoidBottomInset;
  @override
  final bool? barrierDismissible;
  @override
  final bool? useSafeArea;

  RioModalTheme merge(RioModalTheme? other) {
    return copyWith(
      containerTheme: other?.containerTheme ?? containerTheme,
      barrierColor: other?.barrierColor ?? barrierColor,
      padding: other?.padding ?? padding,
      borderRadius: other?.borderRadius ?? borderRadius,
      topBorderRadius: other?.topBorderRadius ?? topBorderRadius,
      showCloseButton: other?.showCloseButton ?? showCloseButton,
      closeButtonTheme: other?.closeButtonTheme ?? closeButtonTheme,
      dismissDirection: other?.dismissDirection ?? dismissDirection,
      maxHeight: other?.maxHeight ?? maxHeight,
      resizeToAvoidBottomInset:
          other?.resizeToAvoidBottomInset ?? resizeToAvoidBottomInset,
      barrierDismissible: other?.barrierDismissible ?? barrierDismissible,
      useSafeArea: other?.useSafeArea ?? useSafeArea,
    );
  }
}

class RioModal extends StatelessWidget {
  const RioModal({
    super.key,
    required this.child,
    this.theme,
    this.onDismissed,
  });

  final Widget child;
  final RioModalTheme? theme;
  final VoidCallback? onDismissed;

  @override
  Widget build(BuildContext context) {
    // For now, use default theme until we add modalTheme to RioTheme
    final modalTheme = const RioModalTheme.defaultTheme().merge(theme);

    final containerTheme = modalTheme.containerTheme ??
        RioTheme.of(context).containerTheme.copyWith(
              color: RioTheme.of(context).colorScheme.surface,
            );

    final effectiveMaxHeight =
        modalTheme.maxHeight ?? MediaQuery.of(context).size.height - 78;

    final topRadius = modalTheme.topBorderRadius ??
        modalTheme.borderRadius ??
        RioTheme.of(context).defaultBorderRadius;

    final modalBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(topRadius),
      topRight: Radius.circular(topRadius),
      bottomLeft: Radius.zero,
      bottomRight: Radius.zero,
    );

    final effectiveCloseButtonTheme = modalTheme.closeButtonTheme ??
        const RioIconButtonTheme(
          variant: RioButtonVariant.soft,
        );

    final borderColor = RioTheme.of(context).colorScheme.onSurface;

    return Dismissible(
      key: const Key('rio_modal'),
      direction: modalTheme.dismissDirection!,
      onDismissed: (_) {
        Navigator.of(context).pop();
        onDismissed?.call();
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: effectiveMaxHeight,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (modalTheme.showCloseButton!)
              RioContainer(
                theme: containerTheme.copyWith(
                  margin: const EdgeInsets.only(bottom: 8, right: 8),
                ),
                child: RioIconButton(
                  theme: effectiveCloseButtonTheme,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onDismissed?.call();
                  },
                ),
              ),
            Flexible(
              child: RioContainer(
                theme: containerTheme.copyWith(
                  borderRadius: modalBorderRadius,
                  border: GradientBoxBorder(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
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
                          borderColor.withValues(alpha: 0.01),
                          RioTheme.of(context).colorScheme.background,
                        ),
                      ],
                    ),
                    width: 2,
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: RioTheme.of(context).colorScheme.onSurface,
                    ),
                    child: SafeArea(
                      minimum: modalTheme.padding ?? EdgeInsets.zero,
                      top: false,
                      left: false,
                      right: false,
                      bottom: modalTheme.useSafeArea!,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: child,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// {@template bottom_modal_route}
/// Custom [PageRoute] that creates a bottom modal dialog.
///
/// Best used with a [Hero] animation.
/// {@endtemplate}
class BottomModalRoute<T> extends PageRoute<T> {
  /// {@macro bottom_modal_route}
  BottomModalRoute({
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    bool resizeToAvoidBottomInset = true,
    Color? barrierColor,
    super.settings,
    super.fullscreenDialog = false,
  })  : _builder = builder,
        _resizeToAvoidBottomInset = resizeToAvoidBottomInset,
        _barrierDismissible = barrierDismissible,
        _barrierColor = barrierColor;

  final WidgetBuilder _builder;
  final bool _barrierDismissible;
  final bool _resizeToAvoidBottomInset;
  final Color? _barrierColor;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => _barrierDismissible;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor =>
      _barrierColor ??
      kCupertinoModalBarrierColor.withValues(
        alpha: 0.05,
      );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final colorTransition = ColorTween(
      end: barrierColor,
      begin: Colors.transparent,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      ),
    );
    return Container(
      color: colorTransition.value,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _builder(context),
            ],
          ),
        ],
      ),
    );
  }

  @override
  String get barrierLabel => 'Modal dialog open';
}

Future<T?> showRioModal<T>(
  BuildContext context, {
  required Widget Function(BuildContext context) builder,
  RioModalTheme? theme,
  VoidCallback? onDismissed,
  bool barrierDismissible = true,
  bool resizeToAvoidBottomInset = false,
  Color? barrierColor,
}) async {
  final navigator = Navigator.of(context);
  final modalTheme = const RioModalTheme.defaultTheme().merge(theme);

  return navigator.push<T>(
    BottomModalRoute<T>(
      barrierDismissible: modalTheme.barrierDismissible ?? barrierDismissible,
      resizeToAvoidBottomInset:
          modalTheme.resizeToAvoidBottomInset ?? resizeToAvoidBottomInset,
      barrierColor: modalTheme.barrierColor ?? barrierColor,
      builder: (context) => RioModal(
        theme: theme,
        onDismissed: onDismissed,
        child: builder(context),
      ),
    ),
  );
}
