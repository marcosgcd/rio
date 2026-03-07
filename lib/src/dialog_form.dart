import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rio/rio.dart';

class RioDialogTitle extends StatelessWidget {
  const RioDialogTitle({
    super.key,
    required this.title,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget title;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: DefaultTextStyle(
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
          child: title,
        ),
      ),
    );
  }
}

class RioDialogDivider extends StatelessWidget {
  const RioDialogDivider({
    super.key,
    this.isVertical = false,
    this.color,
  });

  final bool isVertical;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return isVertical
        ? RioDivider.vertical(color: color)
        : RioDivider.horizontal(color: color);
  }
}

class RioDialogFormRow extends StatelessWidget {
  const RioDialogFormRow({
    super.key,
    required this.label,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.labelMaxWidthFactor = 0.45,
  });

  final String label;
  final Widget child;
  final EdgeInsets padding;
  final CrossAxisAlignment crossAxisAlignment;
  final double labelMaxWidthFactor;

  @override
  Widget build(BuildContext context) {
    final maxLabelWidth =
        MediaQuery.sizeOf(context).width * labelMaxWidthFactor;

    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxLabelWidth),
            child: Text(
              '$label:',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class RioDialogFormTextField extends StatelessWidget {
  const RioDialogFormTextField({
    super.key,
    required this.name,
    this.label,
    this.hintText,
    this.validator,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.textAlign = TextAlign.start,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
  });

  final String name;
  final String? label;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onSubmitted;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final textField = FormBuilderTextField(
      name: name,
      focusNode: focusNode,
      validator: validator,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      textAlign: textAlign,
      minLines: 1,
      maxLines: 1,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.only(left: 8),
        hintText: hintText,
        border: InputBorder.none,
      ),
    );

    if (label == null) {
      return textField;
    }

    return RioDialogFormRow(
      label: label!,
      child: textField,
    );
  }
}

class RioDialogChoiceItem<T> {
  const RioDialogChoiceItem({required this.value, required this.label});

  final T value;
  final String label;
}

class RioDialogFormSingleChoiceField<T> extends StatelessWidget {
  const RioDialogFormSingleChoiceField({
    super.key,
    required this.name,
    required this.label,
    required this.items,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.hintText,
    this.disabled = false,
  });

  final String name;
  final String label;
  final List<RioDialogChoiceItem<T>> items;
  final T? initialValue;
  final FormFieldValidator<T?>? validator;
  final ValueChanged<T?>? onChanged;
  final String? hintText;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T?>(
      name: name,
      initialValue: initialValue,
      validator: validator,
      enabled: !disabled,
      builder: (field) {
        final value = field.value;
        String? selectedLabel;
        for (final item in items) {
          if (item.value == value) {
            selectedLabel = item.label;
            break;
          }
        }

        return RioDialogFormRow(
          label: label,
          child: _RioDialogTapField(
            text: selectedLabel ?? (hintText ?? ''),
            placeholder: selectedLabel == null,
            disabled: disabled,
            trailing: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: RioTheme.of(context).colorScheme.caption,
            ),
            onTap: disabled
                ? null
                : () async {
                    final next = await showRioMenu<T>(
                      context,
                      items: [
                        for (final item in items)
                          RioMenuItem<T>(
                            value: item.value,
                            title: Text(item.label),
                          ),
                      ],
                      selectedValue: value,
                    );
                    if (next == null) return;
                    field.didChange(next);
                    onChanged?.call(next);
                  },
          ),
        );
      },
    );
  }
}

class RioDialogFormMultiChoiceField<T> extends StatelessWidget {
  const RioDialogFormMultiChoiceField({
    super.key,
    required this.name,
    required this.label,
    required this.items,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.disabled = false,
  });

  final String name;
  final String label;
  final List<RioDialogChoiceItem<T>> items;
  final List<T>? initialValue;
  final FormFieldValidator<List<T>>? validator;
  final ValueChanged<List<T>?>? onChanged;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = RioTheme.of(context).colorScheme;

    return FormBuilderField<List<T>>(
      name: name,
      initialValue: initialValue,
      validator: validator,
      enabled: !disabled,
      builder: (field) {
        final selected = List<T>.from(field.value ?? <T>[]);
        return RioDialogFormRow(
          label: label,
          crossAxisAlignment: CrossAxisAlignment.start,
          padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
          child: Align(
            alignment: Alignment.centerRight,
            child: Wrap(
              alignment: WrapAlignment.end,
              runAlignment: WrapAlignment.end,
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final item in items)
                  _RioDialogChoicePill(
                    label: item.label,
                    selected: selected.contains(item.value),
                    disabled: disabled,
                    onTap: () {
                      final isSelected = selected.contains(item.value);
                      final next = isSelected
                          ? selected
                              .where((entry) => entry != item.value)
                              .toList(growable: false)
                          : [...selected, item.value];
                      field.didChange(next);
                      onChanged?.call(next);
                    },
                    borderColor: colorScheme.border,
                    selectedBorderColor: colorScheme.primary,
                    selectedBackgroundColor: colorScheme.primary.withValues(
                      alpha: 0.12,
                    ),
                    textColor: colorScheme.onSurface,
                    selectedTextColor: colorScheme.primary,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RioDialogFormDateField extends StatelessWidget {
  const RioDialogFormDateField({
    super.key,
    required this.name,
    required this.label,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.minimumDate,
    this.maximumDate,
    this.initialDate,
    this.hintText,
    this.clearable = false,
    this.disabled = false,
  });

  final String name;
  final String label;
  final DateTime? initialValue;
  final FormFieldValidator<DateTime?>? validator;
  final ValueChanged<DateTime?>? onChanged;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialDate;
  final String? hintText;
  final bool clearable;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTime?>(
      name: name,
      initialValue: initialValue,
      validator: validator,
      enabled: !disabled,
      builder: (field) {
        final value = field.value;
        final localizations = MaterialLocalizations.of(context);
        final displayText = value == null
            ? (hintText ?? '')
            : localizations.formatCompactDate(value);

        return RioDialogFormRow(
          label: label,
          child: _RioDialogTapField(
            text: displayText,
            placeholder: value == null,
            disabled: disabled,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (clearable && value != null)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: disabled
                        ? null
                        : () {
                            field.didChange(null);
                            onChanged?.call(null);
                          },
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Icon(
                        Icons.close_rounded,
                        size: 14,
                        color: RioTheme.of(context).colorScheme.caption,
                      ),
                    ),
                  ),
                Icon(
                  Icons.calendar_today_rounded,
                  size: 14,
                  color: RioTheme.of(context).colorScheme.caption,
                ),
              ],
            ),
            onTap: disabled
                ? null
                : () async {
                    final now = DateTime.now();
                    final firstDate = minimumDate ?? DateTime(now.year - 120);
                    final lastDate = maximumDate ?? DateTime(now.year + 120);
                    final fallbackInitialDate = _clampDate(
                      initialDate ?? now,
                      firstDate,
                      lastDate,
                    );
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: value ?? fallbackInitialDate,
                      firstDate: firstDate,
                      lastDate: lastDate,
                    );
                    if (picked == null) return;
                    final normalized = DateTime(
                      picked.year,
                      picked.month,
                      picked.day,
                    );
                    field.didChange(normalized);
                    onChanged?.call(normalized);
                  },
          ),
        );
      },
    );
  }
}

DateTime _clampDate(DateTime value, DateTime minimum, DateTime maximum) {
  if (value.isBefore(minimum)) return minimum;
  if (value.isAfter(maximum)) return maximum;
  return value;
}

class _RioDialogTapField extends StatelessWidget {
  const _RioDialogTapField({
    required this.text,
    required this.placeholder,
    required this.disabled,
    this.onTap,
    this.trailing,
  });

  final String text;
  final bool placeholder;
  final bool disabled;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final colorScheme = RioTheme.of(context).colorScheme;
    final textColor = placeholder
        ? colorScheme.hint
        : colorScheme.onSurface.withValues(alpha: disabled ? 0.6 : 1);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerRight,
        constraints: const BoxConstraints(minHeight: 32),
        padding: const EdgeInsets.only(left: 8, right: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.end,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: textColor),
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 4),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}

class _RioDialogChoicePill extends StatelessWidget {
  const _RioDialogChoicePill({
    required this.label,
    required this.selected,
    required this.disabled,
    required this.onTap,
    required this.borderColor,
    required this.selectedBorderColor,
    required this.selectedBackgroundColor,
    required this.textColor,
    required this.selectedTextColor,
  });

  final String label;
  final bool selected;
  final bool disabled;
  final VoidCallback onTap;
  final Color borderColor;
  final Color selectedBorderColor;
  final Color selectedBackgroundColor;
  final Color textColor;
  final Color selectedTextColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: disabled ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: selected ? selectedBackgroundColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? selectedBorderColor : borderColor,
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                color: selected ? selectedTextColor : textColor,
              ),
        ),
      ),
    );
  }
}

class RioDialogFormCheckboxField extends StatelessWidget {
  const RioDialogFormCheckboxField({
    super.key,
    required this.name,
    required this.label,
    this.initialValue,
    this.onChanged,
  });

  final String name;
  final String label;
  final bool? initialValue;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<bool>(
      name: name,
      initialValue: initialValue,
      builder: (field) {
        final value = field.value ?? false;
        return GestureDetector(
          onTap: () {
            field.didChange(!value);
            onChanged?.call(!value);
          },
          child: RioDialogFormRow(
            label: label,
            child: Align(
              alignment: Alignment.centerRight,
              child: RioCheckbox(
                value: value,
                tristate: false,
                theme: const RioCheckboxTheme(
                  margin: EdgeInsets.zero,
                ),
                onChanged: (next) {
                  final checked = next ?? false;
                  field.didChange(checked);
                  onChanged?.call(checked);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class RioDialogActionRow extends StatelessWidget {
  const RioDialogActionRow({
    super.key,
    required this.cancelText,
    required this.confirmText,
    this.onCancel,
    this.onConfirm,
    this.confirmDisabled = false,
    this.confirmLoading = false,
    this.cancelColor = Colors.red,
    this.confirmColor = Colors.green,
  });

  final String cancelText;
  final String confirmText;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  final bool confirmDisabled;
  final bool confirmLoading;
  final Color cancelColor;
  final Color confirmColor;

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = RioTheme.of(context).defaultBorderRadius;

    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: RioButton(
              theme: RioButtonTheme(
                padding: const EdgeInsets.all(16),
                variant: RioButtonVariant.soft,
                color: cancelColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(defaultBorderRadius),
                ),
              ),
              onPressed: onCancel,
              child: Text(cancelText),
            ),
          ),
          const RioDialogDivider(isVertical: true),
          Expanded(
            child: RioButton(
              disabled: confirmDisabled,
              loading: confirmLoading,
              theme: RioButtonTheme(
                padding: const EdgeInsets.all(16),
                variant: RioButtonVariant.soft,
                color: confirmColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(defaultBorderRadius),
                ),
              ),
              onPressed: onConfirm,
              child: Text(confirmText),
            ),
          ),
        ],
      ),
    );
  }
}
