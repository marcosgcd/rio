import 'dart:async';

import 'package:flutter/cupertino.dart';
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
    this.prefixIcon,
    this.suffixIcon,
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
  final Widget? prefixIcon;
  final Widget? suffixIcon;
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
  final _fieldKey =
      GlobalKey<FormBuilderFieldState<FormBuilderField<String>, String>>();

  late TextEditingController _controller;
  late bool _ownsController;

  String? _effectiveInitialValue() {
    if (widget.initialValue != null) {
      return widget.initialValue;
    }
    final externalController = widget.controller;
    if (externalController != null && externalController.text.isNotEmpty) {
      return externalController.text;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _attachController(
      widget.controller ??
          TextEditingController(text: _effectiveInitialValue() ?? ''),
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
            TextEditingController(text: _effectiveInitialValue() ?? ''),
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
      key: _fieldKey,
      name: widget.name,
      initialValue: _effectiveInitialValue(),
      onSaved: widget.onSaved,
      validator: widget.validator,
      valueTransformer: widget.valueTransformer,
      onChanged: widget.onChanged,
      onReset: () {
        final resetValue = _fieldKey.currentState?.initialValue ??
            _effectiveInitialValue() ??
            '';
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
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
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
    this.modalMinHeight,
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
  final double? modalMinHeight;

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
          modalMinHeight: modalMinHeight,
          disabled: disabled || !state.enabled,
        );
      },
    );
  }
}

class RioFormBuilderDateField extends StatelessWidget {
  const RioFormBuilderDateField({
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
    this.decoration,
    this.modalTheme,
    this.clearable = true,
    this.minimumDate,
    this.maximumDate,
    this.initialDate,
    this.dateOrder,
    this.clearTooltip,
    this.clearText,
    this.showTodayButton = false,
    this.todayTooltip,
    this.todayText,
  });

  final String name;
  final DateTime? initialValue;
  final FormFieldSetter<DateTime?>? onSaved;
  final FormFieldValidator<DateTime?>? validator;
  final ValueTransformer<DateTime?>? valueTransformer;
  final ValueChanged<DateTime?>? onChanged;
  final VoidCallback? onReset;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final bool disabled;
  final RioTextFieldTheme? theme;
  final RioTextFieldDecoration? decoration;
  final RioModalTheme? modalTheme;
  final bool clearable;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialDate;
  final DatePickerDateOrder? dateOrder;
  final String? clearTooltip;
  final String? clearText;
  final bool showTodayButton;
  final String? todayTooltip;
  final String? todayText;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTime?>(
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
        final state = field
            as FormBuilderFieldState<FormBuilderField<DateTime?>, DateTime?>;
        final decoration =
            (this.decoration ?? const RioTextFieldDecoration()).copyWith(
          errorText: state.errorText ?? this.decoration?.errorText,
        );

        return RioDateField(
          value: state.value,
          onChanged: state.didChange,
          theme: theme,
          decoration: decoration,
          modalTheme: modalTheme,
          disabled: disabled || !state.enabled,
          clearable: clearable,
          minimumDate: minimumDate,
          maximumDate: maximumDate,
          initialDate: initialDate,
          dateOrder: dateOrder,
          clearTooltip: clearTooltip,
          clearText: clearText,
          showTodayButton: showTodayButton,
          todayTooltip: todayTooltip,
          todayText: todayText,
        );
      },
    );
  }
}

class RioFormBuilderDateRangePicker extends StatelessWidget {
  const RioFormBuilderDateRangePicker({
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
    this.decoration,
    this.modalTheme,
    this.clearable = true,
    this.minimumDate,
    this.maximumDate,
    this.initialMonth,
    this.modalHeight = 500,
    this.clearTooltip,
    this.clearText,
  }) : assert(modalHeight > 0, 'modalHeight must be greater than 0');

  final String name;
  final DateTimeRange? initialValue;
  final FormFieldSetter<DateTimeRange?>? onSaved;
  final FormFieldValidator<DateTimeRange?>? validator;
  final ValueTransformer<DateTimeRange?>? valueTransformer;
  final ValueChanged<DateTimeRange?>? onChanged;
  final VoidCallback? onReset;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final bool disabled;
  final RioTextFieldTheme? theme;
  final RioTextFieldDecoration? decoration;
  final RioModalTheme? modalTheme;
  final bool clearable;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialMonth;
  final double modalHeight;
  final String? clearTooltip;
  final String? clearText;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTimeRange?>(
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
        final state = field as FormBuilderFieldState<
            FormBuilderField<DateTimeRange?>, DateTimeRange?>;
        final decoration =
            (this.decoration ?? const RioTextFieldDecoration()).copyWith(
          errorText: state.errorText ?? this.decoration?.errorText,
        );

        return RioDateRangePicker(
          value: state.value,
          onChanged: state.didChange,
          theme: theme,
          decoration: decoration,
          modalTheme: modalTheme,
          disabled: disabled || !state.enabled,
          clearable: clearable,
          minimumDate: minimumDate,
          maximumDate: maximumDate,
          initialMonth: initialMonth,
          modalHeight: modalHeight,
          clearTooltip: clearTooltip,
          clearText: clearText,
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
    this.decoration,
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
  final RioTextFieldDecoration? decoration;
  final RioToggleButtonsTheme? theme;
  final RioToggleButtonsVariant variant;
  final Axis direction;
  final bool expandItems;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<T>>(
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
            field as FormBuilderFieldState<FormBuilderField<List<T>>, List<T>>;
        final selected = List<T>.from(state.value ?? <T>[]);
        final effectiveDecoration =
            decoration ?? const RioTextFieldDecoration();
        final isDisabled = disabled || !state.enabled;
        final hasError = state.errorText?.isNotEmpty ?? false;
        final effectiveStatusText = hasError
            ? (state.errorText ?? effectiveDecoration.errorText)
            : (effectiveDecoration.helperText ?? effectiveDecoration.hintText);
        final hasStatusText = effectiveStatusText?.isNotEmpty ?? false;
        final helperStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
              color: hasError
                  ? RioTheme.of(context).colorScheme.error
                  : RioTheme.of(context).colorScheme.caption,
            );

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
            if (effectiveDecoration.label != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                  child: effectiveDecoration.label!,
                ),
              ),
            child,
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: helperStyle,
                  ),
                ),
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

  String? _effectiveInitialValue() {
    if (widget.initialValue != null) {
      return widget.initialValue;
    }
    final externalController = widget.controller;
    if (externalController != null && externalController.text.isNotEmpty) {
      return externalController.text;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _attachController(
      widget.controller ??
          TextEditingController(text: _effectiveInitialValue() ?? ''),
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
            TextEditingController(text: _effectiveInitialValue() ?? ''),
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
      initialValue: _effectiveInitialValue(),
      onSaved: widget.onSaved,
      validator: widget.validator,
      valueTransformer: widget.valueTransformer,
      onChanged: widget.onChanged,
      onReset: () {
        _controller.text = _fieldKey.currentState?.initialValue ??
            _effectiveInitialValue() ??
            '';
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
