import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rio/rio.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'checkbox.tailor.dart';

@TailorMixinComponent()
class RioCheckboxTheme extends ThemeExtension<RioCheckboxTheme>
    with DiagnosticableTreeMixin, _$RioCheckboxThemeTailorMixin {
  const RioCheckboxTheme({
    this.margin = EdgeInsets.zero,
    this.gap = 16,
    this.borderRadius,
    this.color,
  });
  @override
  final EdgeInsets margin;
  @override
  final double gap;
  @override
  final BorderRadiusGeometry? borderRadius;
  @override
  final Color? color;
}

class RioCheckbox extends StatefulWidget {
  const RioCheckbox({
    super.key,
    this.label,
    this.theme,
    required this.value,
    required this.onChanged,
    this.disabled = false,
    this.tristate = false,
  });
  final Widget? label;
  final RioCheckboxTheme? theme;
  final bool? value;
  final ValueChanged<bool?> onChanged;
  final bool disabled;
  final bool tristate;

  @override
  State<RioCheckbox> createState() => _RioCheckboxState();
}

class _RioCheckboxState extends State<RioCheckbox> {
  final _duration = const Duration(milliseconds: 100);

  double _scale = 1;
  bool _isFocused = false;
  bool _isHovered = false;
  bool _isPressedDown = false;

  RioCheckboxTheme get _theme =>
      widget.theme ?? RioTheme.of(context).checkboxTheme;
  BorderRadiusGeometry get _borderRadius =>
      _theme.borderRadius ??
      BorderRadius.circular(RioTheme.of(context).defaultBorderRadius / 2);
  MouseCursor get _cursor {
    if (widget.disabled) return SystemMouseCursors.forbidden;

    return SystemMouseCursors.click;
  }

  void _handleTab({
    bool isUp = false,
    bool isDown = false,
    bool isCanceld = false,
  }) {
    if (isUp || isCanceld) {
      setState(() {
        _isPressedDown = false;
        _scale = _resolveScale();
      });
    }

    if (isDown) {
      setState(() {
        _isPressedDown = true;
        _scale = _resolveScale();
      });
    }

    if (isUp) {
      final newValue = switch (widget.value) {
        true => widget.tristate ? null : false,
        false => true,
        null => false,
      };

      widget.onChanged(newValue);
    }
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
    final color = _theme.color ?? Theme.of(context).colorScheme.primary;
    final textColor = _resolveTextColor();
    final textStyle =
        Theme.of(context).textTheme.labelLarge!.copyWith(color: textColor);

    final fillColor = _resolveFillColor(color);
    final borderColor = _resolveBorderColor(color);
    final border =
        borderColor != null ? BorderSide(color: borderColor, width: 2) : null;

    return DefaultTextStyle(
      style: textStyle,
      child: AnimatedPadding(
        duration: _duration,
        padding: _theme.margin,
        child: GestureDetector(
          onTapDown: (_) => _handleTab(isDown: true),
          onTapUp: (_) => _handleTab(isUp: true),
          onTapCancel: () => _handleTab(isCanceld: true),
          child: FocusableActionDetector(
            mouseCursor: _cursor,
            onShowFocusHighlight: _handleFocusHighlight,
            onShowHoverHighlight: _handleHoverHighlight,
            enabled: !widget.disabled,
            descendantsAreFocusable: false,
            descendantsAreTraversable: false,
            shortcuts: {
              LogicalKeySet(
                LogicalKeyboardKey.enter,
                LogicalKeyboardKey.space,
              ): const ActivateIntent(),
            },
            actions: {
              ActivateIntent: CallbackAction<ActivateIntent>(
                onInvoke: (intent) async {
                  _handleTab(isDown: true);

                  await Future.delayed(const Duration(milliseconds: 300));
                  _handleTab(isUp: true);

                  return;
                },
              ),
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedScale(
                  duration: _duration,
                  scale: _scale,
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      fit: StackFit.passthrough,
                      children: [
                        AbsorbPointer(
                          child: Checkbox(
                            value: widget.tristate
                                ? widget.value
                                : widget.value == true,
                            tristate: widget.tristate,
                            activeColor: fillColor,
                            side: border,
                            onChanged: (_) {},
                            shape: RoundedRectangleBorder(
                              borderRadius: _borderRadius,
                            ),
                          ),
                        ),
                        if (_isFocused)
                          Positioned(
                            top: -3,
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                color: fillColor.withOpacity(0.2),
                                borderRadius: _borderRadius,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                if (widget.label != null) SizedBox(width: _theme.gap),
                if (widget.label != null) Flexible(child: widget.label!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _resolveScale() {
    if (widget.disabled) return 1;

    if (_isPressedDown) return 0.92;
    if (_isHovered) return 1.1;
    if (_isFocused) return 1.05;

    return 1;
  }

  Color _resolveFillColor(Color color) {
    if (widget.disabled) {
      return Colors.grey.withOpacity(0.4);
    }
    return color;
  }

  Color? _resolveBorderColor(Color color) {
    if (widget.disabled) {
      return Colors.grey.withOpacity(0.4);
    }

    if (_isFocused) return color;

    return null;
  }

  Color? _resolveTextColor() {
    if (widget.disabled) return Theme.of(context).disabledColor;

    return null;
  }
}
