import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rio/rio.dart';

part 'popover_menu.freezed.dart';

@freezed
class RioMenuItem<T> with _$RioMenuItem {
  factory RioMenuItem({
    required T value,
    required Widget title,
    IconData? icon,
    Widget? iconWidget,
    Color? color,
  }) = _RioMenuItem;
}

Future<T?> showRioMenu<T>(
  BuildContext context, {
  required List<RioMenuItem<T>> items,
  RioPopoverDirection direction = RioPopoverDirection.bottom,
  RioPopoverTheme? theme,
}) async {
  var popoverTheme = theme ?? RioTheme.of(context).popoverTheme;

  if (theme == null) {
    popoverTheme = popoverTheme.copyWith(
      padding: EdgeInsets.zero,
    );
  }

  return showRioPopover(
    context,
    direction: direction,
    theme: popoverTheme,
    bodyBuilder: (poContext) {
      return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 200),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < items.length; i++) ...[
                if (i != 0) const RioDivider(),
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 42),
                  child: RioButton(
                    variant: RioButtonVariant.plain,
                    theme: RioButtonTheme(
                      color: items[i].color ??
                          Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.zero,
                    ),
                    onPressed: () =>
                        Navigator.of(poContext).pop(items[i].value),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        items[i].title,
                        if (items[i].icon != null &&
                            items[i].iconWidget == null)
                          Icon(items[i].icon, size: 24),
                        if (items[i].iconWidget != null) items[i].iconWidget!,
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    },
  );
}
