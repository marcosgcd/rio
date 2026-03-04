import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rio/rio.dart';

class RioDateField extends StatefulWidget {
  const RioDateField({
    super.key,
    required this.value,
    this.onChanged,
    this.theme,
    this.decoration,
    this.modalTheme,
    this.disabled = false,
    this.clearable = true,
    this.minimumDate,
    this.maximumDate,
    this.initialDate,
    this.dateOrder,
    this.clearTooltip,
    this.clearText,
  });

  final DateTime? value;
  final ValueChanged<DateTime?>? onChanged;
  final RioTextFieldTheme? theme;
  final RioTextFieldDecoration? decoration;
  final RioModalTheme? modalTheme;
  final bool disabled;
  final bool clearable;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialDate;
  final DatePickerDateOrder? dateOrder;
  final String? clearTooltip;
  final String? clearText;

  @override
  State<RioDateField> createState() => _RioDateFieldState();
}

class _RioDateFieldState extends State<RioDateField> {
  late final TextEditingController _controller;

  bool get _isEnabled => !widget.disabled && widget.onChanged != null;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    _syncControllerText();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant RioDateField oldWidget) {
    _syncControllerText();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = RioTheme.of(context).colorScheme;
    final iconColor = _isEnabled
        ? colorScheme.hint
        : colorScheme.onSurface.withValues(alpha: 0.38);
    final decoration = widget.decoration?.copyWith(
      hintText: widget.value == null ? widget.decoration?.hintText : null,
    );

    return RioTextField(
      readOnly: true,
      showCursor: false,
      controller: _controller,
      disabled: !_isEnabled,
      theme: widget.theme,
      decoration: decoration,
      suffixIcon: Icon(
        Icons.calendar_month_rounded,
        size: 20,
        color: iconColor,
      ),
      mouseCursor:
          _isEnabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      onTap: _isEnabled ? _openPicker : null,
    );
  }

  void _syncControllerText() {
    final value = widget.value;
    final text = value == null ? '' : _formatDate(value);
    if (_controller.text == text) {
      return;
    }
    _controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  String _formatDate(DateTime value) {
    final day = value.day.toString().padLeft(2, '0');
    final month = value.month.toString().padLeft(2, '0');
    final year = value.year.toString().padLeft(4, '0');
    return '$day.$month.$year';
  }

  DateTime _clampDate(DateTime value) {
    final min = widget.minimumDate;
    if (min != null && value.isBefore(min)) {
      return min;
    }
    final max = widget.maximumDate;
    if (max != null && value.isAfter(max)) {
      return max;
    }
    return value;
  }

  Future<void> _openPicker() async {
    final initialDate = _clampDate(
      widget.value ?? widget.initialDate ?? DateTime.now(),
    );
    final colorScheme = RioTheme.of(context).colorScheme;
    final clearText = widget.clearText ?? 'Clear';

    final modalTheme = const RioModalTheme(
      padding: EdgeInsets.zero,
      useSafeArea: false,
    ).merge(widget.modalTheme);

    await showRioModal<void>(
      context,
      theme: modalTheme,
      floatingHeader: widget.decoration?.label,
      builder: (modalContext) {
        final cupertinoTheme = CupertinoTheme.of(modalContext);
        final pickerTextStyle = cupertinoTheme.textTheme.dateTimePickerTextStyle
            .copyWith(color: colorScheme.onSurface);

        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (widget.clearable)
                RioTooltip(
                  message: widget.clearTooltip,
                  child: RioButton(
                    theme: const RioButtonTheme(
                      variant: RioButtonVariant.plain,
                      margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
                    ),
                    onPressed: () {
                      widget.onChanged?.call(null);
                      Navigator.of(modalContext).pop();
                    },
                    child: Text(clearText),
                  ),
                ),
              SizedBox(
                height: 200,
                child: CupertinoTheme(
                  data: cupertinoTheme.copyWith(
                    textTheme: cupertinoTheme.textTheme.copyWith(
                      dateTimePickerTextStyle: pickerTextStyle,
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    dateOrder: widget.dateOrder,
                    initialDateTime: initialDate,
                    minimumDate: widget.minimumDate,
                    maximumDate: widget.maximumDate,
                    onDateTimeChanged: (value) {
                      widget.onChanged?.call(_clampDate(value));
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
