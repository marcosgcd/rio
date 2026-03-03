import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rio/rio.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'text_field.tailor.dart';
part 'text_field.freezed.dart';

@freezed
class RioTextFieldDecoration with _$RioTextFieldDecoration {
  const factory RioTextFieldDecoration({
    Widget? label,
    String? hintText,
    String? helperText,
    String? errorText,
  }) = _RioTextFieldDecoration;
}

@TailorMixinComponent()
class RioTextFieldTheme extends ThemeExtension<RioTextFieldTheme>
    with DiagnosticableTreeMixin, _$RioTextFieldThemeTailorMixin {
  const RioTextFieldTheme({
    this.margin,
    this.contentPadding,
    this.borderRadius,
    this.filled,
    this.color,
    this.fillColor,
    this.textStyle,
    this.hintStyle,
  });

  const RioTextFieldTheme.defaultTheme()
      : margin = EdgeInsets.zero,
        contentPadding =
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        borderRadius = null,
        filled = false,
        color = null,
        fillColor = null,
        textStyle = null,
        hintStyle = null;

  @override
  final EdgeInsets? margin;
  @override
  final EdgeInsets? contentPadding;
  @override
  final BorderRadius? borderRadius;
  @override
  final bool? filled;
  @override
  final Color? color;
  @override
  final Color? fillColor;
  @override
  final TextStyle? textStyle;
  @override
  final TextStyle? hintStyle;

  RioTextFieldTheme merge(RioTextFieldTheme? other) {
    return const RioTextFieldTheme.defaultTheme().copyWith(
      margin: other?.margin ?? margin,
      contentPadding: other?.contentPadding ?? contentPadding,
      borderRadius: other?.borderRadius ?? borderRadius,
      filled: other?.filled ?? filled,
      color: other?.color ?? color,
      fillColor: other?.fillColor ?? fillColor,
      textStyle: other?.textStyle ?? textStyle,
      hintStyle: other?.hintStyle ?? hintStyle,
    );
  }
}

class RioTextField extends StatefulWidget {
  const RioTextField({
    super.key,
    this.theme,
    this.decoration,
    this.autofocus = false,
    this.focusNode,
    this.autocorrect = true,
    this.autofillHints,
    this.buildCounter,
    this.inputFormatters,
    this.controller,
    this.obscureText = false,
    this.keyboardAppearance,
    this.keyboardType,
    this.maxLength,
    this.onChanged,
    this.textInputAction,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
    this.showCursor,
    this.enableSuggestions = false,
    this.maxLengthEnforcement,
    this.minLines,
    this.maxLines = 1,
    this.expands = false,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.disabled = false,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.dragStartBehavior = DragStartBehavior.start,
    this.scrollController,
    this.scrollPhysics,
    this.smartDashesType,
    this.smartQuotesType,
    this.contextMenuBuilder,
    this.mouseCursor,
    this.obscuringCharacter = '•',
  });
  final RioTextFieldTheme? theme;
  final RioTextFieldDecoration? decoration;

  final bool autofocus;
  final FocusNode? focusNode;
  final bool autocorrect;
  final Iterable<String>? autofillHints;
  final Widget? Function(
    BuildContext, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  })? buildCounter;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final bool obscureText;
  final Brightness? keyboardAppearance;
  final TextInputType? keyboardType;
  final int? maxLength;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final bool? showCursor;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String?)? onSubmitted;
  final bool disabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final DragStartBehavior dragStartBehavior;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;

  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;

  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final MouseCursor? mouseCursor;
  final String obscuringCharacter;

  @override
  State<RioTextField> createState() => _RioTextFieldState();
}

class _RioTextFieldState extends State<RioTextField> {
  late FocusNode _focusNode;
  late bool _ownsFocusNode;
  bool _hasFocus = false;
  bool _isHovered = false;

  late RioTextFieldTheme _theme;

  BorderRadius get _borderRadius =>
      _theme.borderRadius ??
      BorderRadius.circular(RioTheme.of(context).defaultBorderRadius);

  @override
  void initState() {
    super.initState();

    _attachFocusNode(
      widget.focusNode ?? FocusNode(),
      ownsNode: widget.focusNode == null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final rioTheme = RioTheme.of(context);
    final colorScheme = rioTheme.colorScheme;
    final isEnabled = !widget.disabled;
    final hasError = widget.decoration?.errorText?.isNotEmpty ?? false;
    final activeColor = _theme.color ?? colorScheme.primary;
    final decoration = widget.decoration;
    final effectiveHintStyle =
        (_theme.hintStyle ?? Theme.of(context).textTheme.bodyMedium)
            ?.copyWith(color: _theme.hintStyle?.color ?? colorScheme.hint);
    final baseTextStyle = _theme.textStyle ?? Theme.of(context).textTheme.bodyMedium;
    final effectiveTextStyle = isEnabled
        ? baseTextStyle
        : baseTextStyle?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.38),
          );
    final effectiveStatusText = hasError ? decoration?.errorText : decoration?.helperText;
    final hasStatusText = effectiveStatusText?.isNotEmpty ?? false;
    final helperStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: hasError ? colorScheme.error : colorScheme.caption,
        );

    final isFilledVariant = _theme.filled == true;
    final neutralBorderColor = colorScheme.onSurface.withValues(
      alpha: isFilledVariant ? 0.12 : 0.16,
    );
    final hoverBorderColor = colorScheme.onSurface.withValues(
      alpha: isFilledVariant ? 0.18 : 0.26,
    );
    final disabledBorderColor = colorScheme.onSurface.withValues(alpha: 0.08);

    final enabledBorder = OutlineInputBorder(
      borderRadius: _borderRadius,
      borderSide: BorderSide(
        color: _isHovered ? hoverBorderColor : neutralBorderColor,
        width: 1,
      ),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: _borderRadius,
      borderSide: BorderSide(
        color: colorScheme.error,
        width: 1,
      ),
    );
    final disabledBorder = OutlineInputBorder(
      borderRadius: _borderRadius,
      borderSide: BorderSide(
        color: disabledBorderColor,
        width: 1,
      ),
    );
    final focusedBorderColor =
        hasError
            ? colorScheme.error
            : activeColor.withValues(alpha: isFilledVariant ? 0.4 : 0.4);
    final focusedBorder = OutlineInputBorder(
      borderRadius: _borderRadius,
      borderSide: BorderSide(
        color: focusedBorderColor,
        width: 2,
      ),
    );

    Color? fillColor;
    if (isFilledVariant) {
      fillColor = _theme.fillColor ?? activeColor.withValues(alpha: 0.05);
      if (!isEnabled) {
        fillColor = colorScheme.onSurface.withValues(alpha: 0.03);
      } else if (hasError) {
        fillColor =
            colorScheme.error.withValues(alpha: _hasFocus ? 0.03 : 0.02);
      } else if (_hasFocus) {
        fillColor = activeColor.withValues(alpha: 0.03);
      }
    }

    final focusShadowColor = hasError ? colorScheme.error : focusedBorderColor;
    final focusShadowOpacity = hasError ? 0.16 : 0.12;
    final showFocusShadow = _hasFocus && isEnabled;

    return Padding(
      padding: _theme.margin!,
      child: GestureDetector(
        onTap: isEnabled
            ? () {
                _focusNode.requestFocus();
              }
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (decoration?.label != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                  child: decoration!.label!,
                ),
              ),
            MouseRegion(
              cursor: isEnabled ? (widget.mouseCursor ?? SystemMouseCursors.text) : SystemMouseCursors.forbidden,
              onEnter: isEnabled
                  ? (_) {
                      if (!_isHovered) {
                        setState(() {
                          _isHovered = true;
                        });
                      }
                    }
                  : null,
              onExit: isEnabled
                  ? (_) {
                      if (_isHovered) {
                        setState(() {
                          _isHovered = false;
                        });
                      }
                    }
                  : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 140),
                curve: Curves.easeOutCubic,
                decoration: BoxDecoration(
                  borderRadius: _borderRadius,
                  boxShadow: [
                    if (showFocusShadow)
                      BoxShadow(
                        color: focusShadowColor.withValues(
                          alpha: focusShadowOpacity,
                        ),
                        blurRadius: 12,
                        spreadRadius: 1,
                      ),
                  ],
                ),
                child: TextField(
                  autofocus: widget.autofocus,
                  autocorrect: widget.autocorrect,
                  autofillHints: widget.autofillHints,
                  buildCounter: widget.buildCounter,
                  inputFormatters: widget.inputFormatters,
                  controller: widget.controller,
                  obscureText: widget.obscureText,
                  keyboardAppearance: widget.keyboardAppearance,
                  keyboardType: widget.keyboardType,
                  maxLength: widget.maxLength,
                  cursorColor: widget.cursorColor ??
                      (hasError ? colorScheme.error : activeColor),
                  focusNode: _focusNode,
                  onChanged: widget.onChanged,
                  textInputAction: widget.textInputAction,
                  strutStyle: widget.strutStyle,
                  textAlign: widget.textAlign,
                  textAlignVertical: widget.textAlignVertical,
                  textDirection: widget.textDirection,
                  textCapitalization: widget.textCapitalization,
                  readOnly: widget.readOnly,
                  showCursor: widget.showCursor,
                  enableSuggestions: widget.enableSuggestions,
                  maxLengthEnforcement: widget.maxLengthEnforcement,
                  maxLines: widget.maxLines,
                  minLines: widget.minLines,
                  expands: widget.expands,
                  cursorHeight: widget.cursorHeight,
                  cursorRadius: widget.cursorRadius,
                  cursorWidth: widget.cursorWidth,
                  enableInteractiveSelection: widget.enableInteractiveSelection,
                  enabled: isEnabled,
                  dragStartBehavior: widget.dragStartBehavior,
                  mouseCursor: isEnabled
                      ? (widget.mouseCursor ?? SystemMouseCursors.text)
                      : SystemMouseCursors.forbidden,
                  obscuringCharacter: widget.obscuringCharacter,
                  style: effectiveTextStyle,
                  onTap: widget.onTap,
                  onSubmitted: widget.onSubmitted,
                  onEditingComplete: widget.onEditingComplete,
                  contextMenuBuilder: widget.contextMenuBuilder,
                  smartDashesType: widget.smartDashesType,
                  smartQuotesType: widget.smartQuotesType,
                  scrollController: widget.scrollController,
                  scrollPhysics: widget.scrollPhysics,
                  scrollPadding: widget.scrollPadding,
                  decoration: InputDecoration(
                    filled: isFilledVariant,
                    fillColor: fillColor,
                    hoverColor:
                        isFilledVariant ? activeColor.withValues(alpha: 0.04) : null,
                    contentPadding: _theme.contentPadding,
                    hintText: decoration?.hintText,
                    hintStyle: effectiveHintStyle,
                    isDense: false,
                    suffixIcon: hasError
                        ? Icon(
                            Icons.error_outline_rounded,
                            size: 18,
                            color: colorScheme.error,
                          )
                        : null,
                    border: enabledBorder,
                    enabledBorder: hasError ? errorBorder : enabledBorder,
                    disabledBorder: disabledBorder,
                    focusedBorder: focusedBorder,
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder,
                  ),
                ),
              ),
            ),
            RioExpandableVisibility(
              expanded: hasStatusText,
              duration: const Duration(milliseconds: 220),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    effectiveStatusText ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: helperStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _attachFocusNode(
    FocusNode focusNode, {
    required bool ownsNode,
  }) {
    _focusNode = focusNode;
    _ownsFocusNode = ownsNode;
    _focusNode.addListener(_handleFocusChange);
    _hasFocus = _focusNode.hasFocus;
  }

  void _handleFocusChange() {
    if (_hasFocus == _focusNode.hasFocus) {
      return;
    }
    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }

  @override
  void didChangeDependencies() {
    _theme = RioTheme.of(context).textFieldTheme.merge(widget.theme);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant RioTextField oldWidget) {
    if (oldWidget.focusNode != widget.focusNode) {
      _focusNode.removeListener(_handleFocusChange);
      if (_ownsFocusNode) {
        _focusNode.dispose();
      }
      _attachFocusNode(
        widget.focusNode ?? FocusNode(),
        ownsNode: widget.focusNode == null,
      );
    }
    if (widget.disabled) {
      _isHovered = false;
    }
    _theme = RioTheme.of(context).textFieldTheme.merge(widget.theme);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (_ownsFocusNode) {
      _focusNode.dispose();
    }
    super.dispose();
  }
}
