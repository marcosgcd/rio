import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rio/rio.dart';

TextStyle? _errorStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodySmall?.copyWith(
        color: RioTheme.of(context).colorScheme.error,
      );
}

class RioFormBuilderTextField extends StatefulWidget {
  const RioFormBuilderTextField({
    super.key,
    required this.name,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.valueTransformer,
    this.onChanged,
    this.onReset,
    this.focusNode,
    this.autovalidateMode,
    this.enabled = true,
    this.disabled = false,
    this.controller,
    this.theme,
    this.decoration,
    this.autofocus = false,
    this.autocorrect = true,
    this.autofillHints,
    this.inputFormatters,
    this.obscureText = false,
    this.keyboardAppearance,
    this.keyboardType,
    this.maxLength,
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
    this.onSubmitted,
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

  final String name;
  final String? initialValue;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueTransformer<String?>? valueTransformer;
  final ValueChanged<String?>? onChanged;
  final VoidCallback? onReset;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final bool disabled;
  final TextEditingController? controller;
  final RioTextFieldTheme? theme;
  final RioTextFieldDecoration? decoration;
  final bool autofocus;
  final bool autocorrect;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final Brightness? keyboardAppearance;
  final TextInputType? keyboardType;
  final int? maxLength;
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
  final void Function(String?)? onSubmitted;
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
  State<RioFormBuilderTextField> createState() =>
      _RioFormBuilderTextFieldState();
}

class _RioFormBuilderTextFieldState extends State<RioFormBuilderTextField> {
  late TextEditingController _controller;
  late bool _ownsController;

  @override
  void initState() {
    super.initState();
    _attachController(
      widget.controller ??
          TextEditingController(text: widget.initialValue ?? ''),
      owns: widget.controller == null,
    );
  }

  @override
  void didUpdateWidget(covariant RioFormBuilderTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      if (_ownsController) {
        _controller.dispose();
      }
      _attachController(
        widget.controller ??
            TextEditingController(text: widget.initialValue ?? ''),
        owns: widget.controller == null,
      );
    }
  }

  @override
  void dispose() {
    if (_ownsController) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _attachController(
    TextEditingController controller, {
    required bool owns,
  }) {
    _controller = controller;
    _ownsController = owns;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: widget.name,
      initialValue: widget.initialValue ?? _controller.text,
      onSaved: widget.onSaved,
      validator: widget.validator,
      valueTransformer: widget.valueTransformer,
      onChanged: widget.onChanged,
      onReset: () {
        final resetValue = widget.initialValue ?? '';
        _controller.value = TextEditingValue(
          text: resetValue,
          selection: TextSelection.collapsed(offset: resetValue.length),
        );
        widget.onReset?.call();
      },
      focusNode: widget.focusNode,
      autovalidateMode: widget.autovalidateMode,
      enabled: widget.enabled,
      builder: (field) {
        final state =
            field as FormBuilderFieldState<FormBuilderField<String>, String>;
        final value = state.value ?? '';

        if (_controller.text != value) {
          _controller.value = TextEditingValue(
            text: value,
            selection: TextSelection.collapsed(offset: value.length),
          );
        }

        final decoration =
            (widget.decoration ?? const RioTextFieldDecoration()).copyWith(
          errorText: state.errorText ?? widget.decoration?.errorText,
        );

        return RioTextField(
          controller: _controller,
          focusNode: state.effectiveFocusNode,
          theme: widget.theme,
          decoration: decoration,
          disabled: widget.disabled || !state.enabled,
          autofocus: widget.autofocus,
          autocorrect: widget.autocorrect,
          autofillHints: widget.autofillHints,
          inputFormatters: widget.inputFormatters,
          obscureText: widget.obscureText,
          keyboardAppearance: widget.keyboardAppearance,
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
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
          onChanged: state.didChange,
          onSubmitted: widget.onSubmitted,
          cursorWidth: widget.cursorWidth,
          cursorHeight: widget.cursorHeight,
          cursorRadius: widget.cursorRadius,
          cursorColor: widget.cursorColor,
          scrollPadding: widget.scrollPadding,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          dragStartBehavior: widget.dragStartBehavior,
          scrollController: widget.scrollController,
          scrollPhysics: widget.scrollPhysics,
          smartDashesType: widget.smartDashesType,
          smartQuotesType: widget.smartQuotesType,
          contextMenuBuilder: widget.contextMenuBuilder,
          mouseCursor: widget.mouseCursor,
          obscuringCharacter: widget.obscuringCharacter,
        );
      },
    );
  }
}

class RioFormBuilderCheckbox extends StatelessWidget {
  const RioFormBuilderCheckbox({
    super.key,
    required this.name,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.valueTransformer,
    this.onChanged,
    this.onReset,
    this.focusNode,
    this.autovalidateMode,
    this.enabled = true,
    this.disabled = false,
    this.theme,
    this.label,
    this.tristate = false,
  });

  final String name;
  final bool? initialValue;
  final FormFieldSetter<bool?>? onSaved;
  final FormFieldValidator<bool?>? validator;
  final ValueTransformer<bool?>? valueTransformer;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback? onReset;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final bool disabled;
  final RioCheckboxTheme? theme;
  final Widget? label;
  final bool tristate;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<bool?>(
      name: name,
      initialValue: initialValue,
      onSaved: onSaved,
      validator: validator,
      valueTransformer: valueTransformer,
      onChanged: onChanged,
      onReset: onReset,
      focusNode: focusNode,
      autovalidateMode: autovalidateMode,
      enabled: enabled,
      builder: (field) {
        final state =
            field as FormBuilderFieldState<FormBuilderField<bool?>, bool?>;
        final hasError = state.errorText?.isNotEmpty ?? false;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RioCheckbox(
              theme: theme,
              label: label,
              tristate: tristate,
              value: state.value,
              disabled: disabled || !state.enabled,
              onChanged: state.didChange,
            ),
            if (hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  state.errorText!,
                  style: _errorStyle(context),
                ),
              ),
          ],
        );
      },
    );
  }
}

class RioFormBuilderDropdownField<T> extends StatelessWidget {
  const RioFormBuilderDropdownField({
    super.key,
    required this.name,
    required this.items,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.valueTransformer,
    this.onChanged,
    this.onReset,
    this.focusNode,
    this.autovalidateMode,
    this.enabled = true,
    this.disabled = false,
    this.theme,
    this.decoration,
    this.popoverTheme,
    this.modalTheme,
    this.behavior = RioDropdownFieldBehavior.auto,
    this.direction = RioPopoverDirection.bottom,
    this.menuMinWidth = 200,
    this.offset,
  });

  final String name;
  final List<RioDropdownFieldItem<T>> items;
  final T? initialValue;
  final FormFieldSetter<T?>? onSaved;
  final FormFieldValidator<T?>? validator;
  final ValueTransformer<T?>? valueTransformer;
  final ValueChanged<T?>? onChanged;
  final VoidCallback? onReset;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final bool disabled;
  final RioTextFieldTheme? theme;
  final RioTextFieldDecoration? decoration;
  final RioPopoverTheme? popoverTheme;
  final RioModalTheme? modalTheme;
  final RioDropdownFieldBehavior behavior;
  final RioPopoverDirection direction;
  final double menuMinWidth;
  final Offset? offset;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T?>(
      name: name,
      initialValue: initialValue,
      onSaved: onSaved,
      validator: validator,
      valueTransformer: valueTransformer,
      onChanged: onChanged,
      onReset: onReset,
      focusNode: focusNode,
      autovalidateMode: autovalidateMode,
      enabled: enabled,
      builder: (field) {
        final state = field as FormBuilderFieldState<FormBuilderField<T?>, T?>;
        final decoration =
            (this.decoration ?? const RioTextFieldDecoration()).copyWith(
          errorText: state.errorText ?? this.decoration?.errorText,
        );

        return RioDropdownField<T>(
          items: items,
          value: state.value,
          onChanged: state.didChange,
          theme: theme,
          decoration: decoration,
          popoverTheme: popoverTheme,
          modalTheme: modalTheme,
          behavior: behavior,
          direction: direction,
          menuMinWidth: menuMinWidth,
          offset: offset,
          disabled: disabled || !state.enabled,
        );
      },
    );
  }
}

class RioFormBuilderToggleButtons<T> extends StatelessWidget {
  const RioFormBuilderToggleButtons({
    super.key,
    required this.name,
    required this.items,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.valueTransformer,
    this.onChanged,
    this.onReset,
    this.focusNode,
    this.autovalidateMode,
    this.enabled = true,
    this.disabled = false,
    this.theme,
    this.variant = RioToggleButtonsVariant.solid,
    this.direction = Axis.horizontal,
    this.expandItems = false,
  });

  final String name;
  final List<RioToggleButtonsItem<T>> items;
  final List<T>? initialValue;
  final FormFieldSetter<List<T>>? onSaved;
  final FormFieldValidator<List<T>>? validator;
  final ValueTransformer<List<T>?>? valueTransformer;
  final ValueChanged<List<T>?>? onChanged;
  final VoidCallback? onReset;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final bool disabled;
  final RioToggleButtonsTheme? theme;
  final RioToggleButtonsVariant variant;
  final Axis direction;
  final bool expandItems;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<T>>(
      name: name,
      initialValue: initialValue ?? <T>[],
      onSaved: onSaved,
      validator: validator,
      valueTransformer: valueTransformer,
      onChanged: onChanged,
      onReset: onReset,
      focusNode: focusNode,
      autovalidateMode: autovalidateMode,
      enabled: enabled,
      builder: (field) {
        final state =
            field as FormBuilderFieldState<FormBuilderField<List<T>>, List<T>>;
        final selected = List<T>.from(state.value ?? <T>[]);
        final isDisabled = disabled || !state.enabled;
        final hasError = state.errorText?.isNotEmpty ?? false;

        Widget child = RioToggleButtons<T>(
          items: items,
          selected: selected,
          theme: theme,
          variant: variant,
          direction: direction,
          expandItems: expandItems,
          onChanged: state.didChange,
        );

        if (isDisabled) {
          child = IgnorePointer(
            child: Opacity(
              opacity: 0.6,
              child: child,
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
            if (hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  state.errorText!,
                  style: _errorStyle(context),
                ),
              ),
          ],
        );
      },
    );
  }
}

class RioFormBuilderPinField extends StatefulWidget {
  const RioFormBuilderPinField({
    super.key,
    required this.name,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.valueTransformer,
    this.onChanged,
    this.onReset,
    this.focusNode,
    this.autovalidateMode,
    this.enabled = true,
    this.disabled = false,
    this.count = 6,
    this.onCompleted,
    this.autoFocus = false,
    this.errorAnimationController,
    this.controller,
    this.obscureText = true,
    this.theme,
  });

  final String name;
  final String? initialValue;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueTransformer<String?>? valueTransformer;
  final ValueChanged<String?>? onChanged;
  final VoidCallback? onReset;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final bool disabled;
  final int count;
  final ValueChanged<String>? onCompleted;
  final bool autoFocus;
  final StreamController<ErrorAnimationType>? errorAnimationController;
  final TextEditingController? controller;
  final bool obscureText;
  final RioPinFieldTheme? theme;

  @override
  State<RioFormBuilderPinField> createState() => _RioFormBuilderPinFieldState();
}

class _RioFormBuilderPinFieldState extends State<RioFormBuilderPinField> {
  final _fieldKey =
      GlobalKey<FormBuilderFieldState<FormBuilderField<String>, String>>();

  late TextEditingController _controller;
  late bool _ownsController;

  @override
  void initState() {
    super.initState();
    _attachController(
      widget.controller ??
          TextEditingController(text: widget.initialValue ?? ''),
      owns: widget.controller == null,
    );
    _controller.addListener(_handleControllerChanged);
  }

  @override
  void didUpdateWidget(covariant RioFormBuilderPinField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _controller.removeListener(_handleControllerChanged);
      if (_ownsController) {
        _controller.dispose();
      }
      _attachController(
        widget.controller ??
            TextEditingController(text: widget.initialValue ?? ''),
        owns: widget.controller == null,
      );
      _controller.addListener(_handleControllerChanged);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerChanged);
    if (_ownsController) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _attachController(
    TextEditingController controller, {
    required bool owns,
  }) {
    _controller = controller;
    _ownsController = owns;
  }

  void _handleControllerChanged() {
    final state = _fieldKey.currentState;
    if (state == null) {
      return;
    }
    final value = _controller.text;
    if (state.value != value) {
      state.didChange(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      key: _fieldKey,
      name: widget.name,
      initialValue: widget.initialValue ?? _controller.text,
      onSaved: widget.onSaved,
      validator: widget.validator,
      valueTransformer: widget.valueTransformer,
      onChanged: widget.onChanged,
      onReset: () {
        _controller.text = widget.initialValue ?? '';
        widget.onReset?.call();
      },
      focusNode: widget.focusNode,
      autovalidateMode: widget.autovalidateMode,
      enabled: widget.enabled,
      builder: (field) {
        final state =
            field as FormBuilderFieldState<FormBuilderField<String>, String>;
        final value = state.value ?? '';
        final hasError = state.errorText?.isNotEmpty ?? false;

        if (_controller.text != value) {
          _controller.value = TextEditingValue(
            text: value,
            selection: TextSelection.collapsed(offset: value.length),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RioPinField(
              count: widget.count,
              onCompleted: (value) {
                state.didChange(value);
                widget.onCompleted?.call(value);
              },
              autoFocus: widget.autoFocus,
              errorAnimationController: widget.errorAnimationController,
              controller: _controller,
              obscureText: widget.obscureText,
              disabled: widget.disabled || !state.enabled,
              theme: widget.theme,
            ),
            if (hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  state.errorText!,
                  style: _errorStyle(context),
                ),
              ),
          ],
        );
      },
    );
  }
}
