import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rio/rio.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'utils.dart';

part 'button.tailor.dart';

@TailorMixinComponent()
class RioButtonTheme extends ThemeExtension<RioButtonTheme>
    with DiagnosticableTreeMixin, _$RioButtonThemeTailorMixin {
  const RioButtonTheme({
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.borderRadius,
    this.border,
  });
  @override
  final EdgeInsets margin;
  @override
  final EdgeInsets padding;
  @override
  final BorderRadiusGeometry? borderRadius;
  @override
  final BoxBorder? border;
}

enum RioButtonVariant {
  solid,
  soft,
  outlined,
  plain,
}

enum RioButtonOnPressedAwaitMode {
  none,
  highlight,
  loading,
}

class RioButton extends StatefulWidget {
  const RioButton({
    super.key,
    required this.child,
    this.variant = RioButtonVariant.solid,
    this.disabled = false,
    this.loading = false,
    this.onPressedAwaitMode = RioButtonOnPressedAwaitMode.none,
    this.cursor,
    this.onPressed,
    this.color,
    this.theme,
    this.disableScale = false,
  });
  final Widget child;
  final bool disabled;
  final bool loading;
  final MouseCursor? cursor;
  final RioButtonOnPressedAwaitMode onPressedAwaitMode;
  final FutureOr<void> Function()? onPressed;
  final RioButtonVariant variant;
  final Color? color;
  final RioButtonTheme? theme;
  final bool disableScale;

  @override
  State<RioButton> createState() => _RioButtonState();
}

class _RioButtonState extends State<RioButton> {
  final _duration = const Duration(milliseconds: 100);
  final _contentKey = GlobalKey();

  double _scale = 1;
  bool _isFocused = false;
  bool _isHovered = false;
  bool _isPressedDown = false;
  bool _isWaintingForOnPressedFuture = false;

  RioButtonTheme get _theme => widget.theme ?? RioTheme.of(context).buttonTheme;
  BorderRadiusGeometry get _borderRadius =>
      _theme.borderRadius ??
      BorderRadius.circular(RioTheme.of(context).defaultBorderRadius);
  bool get _disabled => widget.disabled || _loading;
  bool get _loading =>
      widget.loading ||
      (_isWaintingForOnPressedFuture &&
          widget.onPressedAwaitMode == RioButtonOnPressedAwaitMode.loading);
  MouseCursor get _cursor {
    if (widget.cursor != null) return widget.cursor!;
    if (_disabled) return SystemMouseCursors.forbidden;

    return SystemMouseCursors.click;
  }

  Future<void> _handleOnTap() async {
    if (widget.onPressed is Future Function() &&
        widget.onPressedAwaitMode != RioButtonOnPressedAwaitMode.none) {
      setState(() {
        _isWaintingForOnPressedFuture = true;
      });
      await widget.onPressed?.call();
      setState(() {
        _isWaintingForOnPressedFuture = false;
      });
    } else {
      widget.onPressed?.call();
    }
  }

  void _handleOnPressedDown(bool isPressedDown) {
    if (_disabled) return;

    setState(() {
      _isPressedDown = isPressedDown;
      _scale = _resolveScale();
    });
  }

  void _handleFocusHighlight(bool value) {
    setState(() {
      _isFocused = value;
      _scale = _resolveScale();
    });
  }

  void _handleHoverHighlight(bool value) {
    setState(() {
      _isHovered = value;
      _scale = _resolveScale();
    });
  }

  @override
  Widget build(BuildContext context) {
    final callBack = _disabled ? null : _handleOnTap;
    final color = widget.color ?? Theme.of(context).colorScheme.primary;
    final textColor = _resolveTextColor(color);
    final backgroundColor = _resolveBackgroundColor(color);
    final foregroundColor = _resolveForegroundColor(textColor);

    final border = _resolveBorder(backgroundColor, textColor);
    final textStyle = Theme.of(context).textTheme.labelLarge!.copyWith(
          color: textColor,
        );

    final decoration = BoxDecoration(
      border: border,
      color: backgroundColor,
      borderRadius: _borderRadius,
    );

    final foregroundDecoration = BoxDecoration(
      color: foregroundColor,
      borderRadius: _borderRadius,
    );

    return IconTheme.merge(
      data: IconThemeData(color: textColor, size: textStyle.fontSize),
      child: DefaultTextStyle(
        style: textStyle,
        child: AnimatedPadding(
          duration: _duration,
          padding: _theme.margin,
          child: GestureDetector(
            onTap: callBack,
            onTapDown: (_) => _handleOnPressedDown(true),
            onTapUp: (_) => _handleOnPressedDown(false),
            onTapCancel: () => _handleOnPressedDown(false),
            child: FocusableActionDetector(
              mouseCursor: _cursor,
              onShowFocusHighlight: _handleFocusHighlight,
              onShowHoverHighlight: _handleHoverHighlight,
              enabled: !_disabled,
              shortcuts: {
                LogicalKeySet(
                  LogicalKeyboardKey.enter,
                  LogicalKeyboardKey.space,
                ): const ActivateIntent(),
              },
              actions: {
                ActivateIntent: CallbackAction<ActivateIntent>(
                  onInvoke: (intent) async {
                    _handleOnPressedDown(true);
                    await callBack?.call();
                    await Future.delayed(const Duration(milliseconds: 300));
                    _handleOnPressedDown(false);
                    return;
                  },
                ),
              },
              child: AnimatedContainer(
                duration: _duration,
                padding: _theme.padding,
                decoration: decoration,
                foregroundDecoration: foregroundDecoration,
                child: AnimatedScale(
                  duration: _duration,
                  scale: _scale,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Visibility.maintain(
                        key: _contentKey,
                        visible: !_loading,
                        child: widget.child,
                      ),
                      if (_loading) _Loading(size: textStyle.fontSize!),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _resolveScale() {
    double result = 1;

    if (widget.disableScale || _disabled) return 1;

    const scaleValue = 16;
    double contentWidth = 0;
    try {
      contentWidth = _contentKey.currentContext?.size?.width ?? 0;
    } catch (_) {}

    if (_isPressedDown) {
      final targetWidth = contentWidth - (scaleValue / 2);
      result = 1 - (1 - targetWidth / contentWidth) / 2;
    }
    if ((_isFocused || _isHovered) && !_isPressedDown) {
      final targetWidth = contentWidth + scaleValue;
      result = (((targetWidth / contentWidth) - 1) / 2) + 1;
    }

    return result;
  }

  Color _resolveBackgroundColor(Color color) {
    switch (widget.variant) {
      case RioButtonVariant.solid:
        if (_disabled) {
          return Colors.grey.withOpacity(0.4);
        }
        return color;
      case RioButtonVariant.soft:
        if (_disabled) {
          return Colors.grey.withOpacity(0.12);
        }
        return color.withOpacity(0.12);
      case RioButtonVariant.outlined:
      case RioButtonVariant.plain:
        return Colors.transparent;
    }
  }

  Color _resolveTextColor(Color color) {
    switch (widget.variant) {
      case RioButtonVariant.solid:
        if (_disabled) return Colors.grey;

        return computeTextColorForBackground(color);
      case RioButtonVariant.soft:
        if (_disabled) return Colors.grey.withOpacity(0.8);

        break;
      case RioButtonVariant.outlined:
      case RioButtonVariant.plain:
        if (_disabled) return Colors.grey;
    }

    return color;
  }

  Color _resolveForegroundColor(Color textColor) {
    if (_disabled) return Colors.transparent;
    if (_isPressedDown) return textColor.withOpacity(0.6);
    if (_isHovered ||
        (_isWaintingForOnPressedFuture &&
            widget.onPressedAwaitMode ==
                RioButtonOnPressedAwaitMode.highlight)) {
      return textColor.withOpacity(0.4);
    }

    if (_isFocused) return textColor.withOpacity(0.2);

    return Colors.transparent;
  }

  BoxBorder _resolveBorder(Color backgroundColor, Color textColor) {
    if (_theme.border != null) {
      return _theme.border!;
    }

    switch (widget.variant) {
      case RioButtonVariant.outlined:
        return Border.all(color: textColor.withOpacity(0.2));

      default:
        return Border.all(color: Colors.transparent);
    }
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key, required this.size}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 3),
      child: Transform.scale(
        scale: 2.5,
        child: LoadingAnimationWidget.waveDots(
          color: Colors.grey,
          size: size,
        ),
      ),
    );
  }
}