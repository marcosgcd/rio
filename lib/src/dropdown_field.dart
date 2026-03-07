import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rio/rio.dart';

class RioDropdownFieldItem<T> {
  const RioDropdownFieldItem({
    required this.value,
    required this.label,
    this.title,
    this.icon,
    this.tooltip,
    this.trailing,
    this.color,
  });

  final T value;
  final String label;
  final Widget? title;
  final Widget? icon;
  final String? tooltip;
  final Widget? trailing;
  final Color? color;
}

enum RioDropdownFieldBehavior {
  auto,
  dropdown,
  modal,
}

class RioDropdownField<T> extends StatefulWidget {
  const RioDropdownField({
    super.key,
    required this.items,
    required this.value,
    this.onChanged,
    this.theme,
    this.decoration,
    this.popoverTheme,
    this.modalTheme,
    this.behavior = RioDropdownFieldBehavior.auto,
    this.direction = RioPopoverDirection.bottom,
    this.menuMinWidth = 200,
    this.offset,
    this.modalMinHeight,
    this.disabled = false,
  });

  final List<RioDropdownFieldItem<T>> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final RioTextFieldTheme? theme;
  final RioTextFieldDecoration? decoration;
  final RioPopoverTheme? popoverTheme;
  final RioModalTheme? modalTheme;
  final RioDropdownFieldBehavior behavior;
  final RioPopoverDirection direction;
  final double menuMinWidth;
  final Offset? offset;
  final double? modalMinHeight;
  final bool disabled;

  @override
  State<RioDropdownField<T>> createState() => _RioDropdownFieldState<T>();
}

class _RioDropdownFieldState<T> extends State<RioDropdownField<T>> {
  static const _menuGap = 6.0;

  final GlobalKey _inputKey = GlobalKey();
  late final TextEditingController _controller;

  bool get _isEnabled =>
      !widget.disabled && widget.onChanged != null && widget.items.isNotEmpty;

  RioDropdownFieldBehavior get _effectiveBehavior {
    if (widget.behavior != RioDropdownFieldBehavior.auto) {
      return widget.behavior;
    }

    final mediaQuery = MediaQuery.maybeOf(context);
    if (mediaQuery != null && mediaQuery.size.shortestSide < 700) {
      return RioDropdownFieldBehavior.modal;
    }

    final platform = Theme.of(context).platform;
    final isMobilePlatform =
        platform == TargetPlatform.android || platform == TargetPlatform.iOS;
    if (!kIsWeb && isMobilePlatform) {
      return RioDropdownFieldBehavior.modal;
    }

    return RioDropdownFieldBehavior.dropdown;
  }

  RioDropdownFieldItem<T>? get _selectedItem {
    final value = widget.value;
    if (value == null) {
      return null;
    }

    for (final item in widget.items) {
      if (item.value == value) {
        return item;
      }
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _syncControllerText();
  }

  @override
  void didUpdateWidget(covariant RioDropdownField<T> oldWidget) {
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
    final selectedItem = _selectedItem;
    final colorScheme = RioTheme.of(context).colorScheme;
    final iconColor = _isEnabled
        ? colorScheme.hint
        : colorScheme.onSurface.withValues(alpha: 0.38);
    final selectedIcon = selectedItem?.icon ?? selectedItem?.trailing;
    final selectedSuffixColor = _isEnabled
        ? (selectedItem?.color ?? colorScheme.onSurface)
        : colorScheme.onSurface.withValues(alpha: 0.38);
    final effectiveSuffixIcon = selectedIcon == null
        ? Icon(
            Icons.keyboard_arrow_down_rounded,
            color: iconColor,
          )
        : IconTheme.merge(
            data: IconThemeData(
              color: selectedSuffixColor,
              size: 18,
            ),
            child: selectedIcon,
          );
    final decoration = widget.decoration?.copyWith(
      hintText: selectedItem == null ? widget.decoration?.hintText : null,
    );

    return RioTextField(
      inputKey: _inputKey,
      readOnly: true,
      showCursor: false,
      controller: _controller,
      disabled: !_isEnabled,
      theme: widget.theme,
      decoration: decoration,
      suffixIcon: effectiveSuffixIcon,
      mouseCursor:
          _isEnabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      onTap: _isEnabled ? _openSelector : null,
    );
  }

  void _syncControllerText() {
    final label = _selectedItem?.label ?? '';
    if (_controller.text == label) {
      return;
    }

    _controller.value = TextEditingValue(
      text: label,
      selection: TextSelection.collapsed(offset: label.length),
    );
  }

  Future<void> _openSelector() async {
    final selectedValue = switch (_effectiveBehavior) {
      RioDropdownFieldBehavior.dropdown => await _openMenu(),
      RioDropdownFieldBehavior.modal => await _openModal(),
      RioDropdownFieldBehavior.auto => null,
    };

    if (!mounted || selectedValue == null) {
      return;
    }

    widget.onChanged?.call(selectedValue);
  }

  Future<T?> _openMenu() async {
    final targetContext = _inputKey.currentContext;
    if (!_isEnabled || targetContext == null) {
      return null;
    }

    final targetRenderBox = targetContext.findRenderObject() as RenderBox?;
    final targetWidth = targetRenderBox?.size.width ?? widget.menuMinWidth;
    final menuOffset = Offset(
      widget.offset?.dx ?? 0,
      (widget.offset?.dy ?? 0) + _menuGap,
    );

    return showRioMenu<T>(
      targetContext,
      items: [
        for (final item in widget.items)
          RioMenuItem(
            value: item.value,
            title: _itemTitle(item),
            tooltip: item.tooltip,
            color: item.color,
            icon: _itemIcon(item),
          ),
      ],
      selectedValue: widget.value,
      direction: widget.direction,
      theme: widget.popoverTheme,
      minWidth: math.max(widget.menuMinWidth, targetWidth),
      width: targetWidth,
      offset: menuOffset,
    );
  }

  Future<T?> _openModal() async {
    final modalTheme = const RioModalTheme(
      padding: EdgeInsets.zero,
      useSafeArea: false,
    ).merge(widget.modalTheme);

    return showRioModal<T>(
      context,
      theme: modalTheme,
      floatingHeader: widget.decoration?.label,
      builder: (modalContext) {
        final colorScheme = RioTheme.of(modalContext).colorScheme;
        final listMaxHeight = MediaQuery.of(modalContext).size.height * 0.5;
        final configuredMinHeight = widget.modalMinHeight ?? 0;
        final listMinHeight = math.min(configuredMinHeight, listMaxHeight);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: listMinHeight,
                maxHeight: listMaxHeight,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  final isSelected = item.value == widget.value;
                  final itemColor = item.color ??
                      (isSelected
                          ? colorScheme.primary
                          : colorScheme.onSurface);

                  return ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 42),
                    child: RioButton(
                      tooltip: item.tooltip,
                      theme: RioButtonTheme(
                        variant: isSelected
                            ? RioButtonVariant.soft
                            : RioButtonVariant.plain,
                        iconPosition: RioButtonIconPosition.edge,
                        color: itemColor,
                        borderRadius: BorderRadius.zero,
                      ),
                      onPressed: () =>
                          Navigator.of(modalContext).pop(item.value),
                      trailing: _itemIcon(item),
                      child: _itemTitle(item),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const RioDivider(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _itemTitle(RioDropdownFieldItem<T> item) {
    return item.title ?? Text(item.label);
  }

  Widget? _itemIcon(RioDropdownFieldItem<T> item) {
    return item.trailing ?? item.icon;
  }
}
