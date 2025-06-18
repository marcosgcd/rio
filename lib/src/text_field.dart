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
  });

  const RioTextFieldTheme.defaultTheme()
      : margin = EdgeInsets.zero,
        contentPadding =
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        borderRadius = null,
        filled = false,
        color = null;

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

  RioTextFieldTheme merge(RioTextFieldTheme? other) {
    return const RioTextFieldTheme.defaultTheme().copyWith(
      margin: other?.margin ?? margin,
      contentPadding: other?.contentPadding ?? contentPadding,
      borderRadius: other?.borderRadius ?? borderRadius,
      filled: other?.filled ?? filled,
      color: other?.color ?? color,
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

  late RioTextFieldTheme _theme;

  BorderRadius get _borderRadius =>
      _theme.borderRadius ??
      BorderRadius.circular(RioTheme.of(context).defaultBorderRadius);

  @override
  void initState() {
    super.initState();

    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    var color = _theme.color ?? RioTheme.of(context).colorScheme.primary;
    final decoration = widget.decoration;

    if (decoration?.errorText != null) {
      color = Theme.of(context).colorScheme.error;
    }

    return Padding(
      padding: _theme.margin!,
      child: GestureDetector(
        onTap: () {
          _focusNode.requestFocus();
        },
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
            TextField(
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
              cursorColor: widget.cursorColor ?? color,
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              textInputAction: widget.textInputAction,
              strutStyle: widget.strutStyle,
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
              enabled: !widget.disabled,
              dragStartBehavior: widget.dragStartBehavior,
              mouseCursor: widget.disabled
                  ? SystemMouseCursors.forbidden
                  : widget.mouseCursor,
              obscuringCharacter: widget.obscuringCharacter,
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
                filled: _theme.filled == true,
                fillColor: color.withValues(alpha: 0.05),
                focusColor: color,
                contentPadding: _theme.contentPadding,
                hintText: decoration?.hintText,
                isDense: true,
                errorText: decoration?.errorText != null ? "" : null,
                errorStyle: const TextStyle(height: 0),
                border: OutlineInputBorder(
                  borderRadius: _borderRadius,
                ),
              ),
            ),
            if (decoration?.helperText != null ||
                (decoration?.errorText != null &&
                    decoration!.errorText!.isNotEmpty))
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: decoration?.errorText != null
                            ? Theme.of(context).colorScheme.error
                            : null,
                      ),
                  decoration?.errorText ?? decoration!.helperText!,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    _theme = RioTheme.of(context).textFieldTheme.merge(widget.theme);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant RioTextField oldWidget) {
    _theme = RioTheme.of(context).textFieldTheme.merge(widget.theme);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }
}
