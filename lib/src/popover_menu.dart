import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rio/rio.dart';

part 'popover_menu.freezed.dart';

@freezed
class RioMenuItem<T> with _$RioMenuItem {
  factory RioMenuItem({
    required T value,
    required Widget title,
    String? tooltip,
    Widget? icon,
    Color? color,
  }) = _RioMenuItem;
}

Future<T?> showRioMenu<T>(
  BuildContext context, {
  required List<RioMenuItem<T>> items,
  RioPopoverDirection direction = RioPopoverDirection.bottom,
  RioPopoverTheme? theme,
  double minWidth = 200,
}) async {
  var popoverTheme = theme ?? RioTheme.of(context).popoverTheme;
  final borderRadius =
      popoverTheme.borderRadius ?? RioTheme.of(context).defaultBorderRadius;

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
      final itemRadios = Radius.circular(borderRadius);
      final itemWidgets = items.map((item) {
        final isFirst = items.first == item;
        final isLast = items.last == item;
        return ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 42),
          child: RioButton(
            tooltip: item.tooltip,
            theme: RioButtonTheme(
              variant: RioButtonVariant.plain,
              iconPosition: RioButtonIconPosition.edge,
              color: item.color ?? RioTheme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.only(
                topLeft: isFirst ? itemRadios : Radius.zero,
                topRight: isFirst ? itemRadios : Radius.zero,
                bottomLeft: isLast ? itemRadios : Radius.zero,
                bottomRight: isLast ? itemRadios : Radius.zero,
              ),
            ),
            onPressed: () => Navigator.of(poContext).pop(item.value),
            trailing: item.icon,
            child: item.title,
          ),
        );
      }).toList();

      return ConstrainedBox(
        constraints: BoxConstraints(minWidth: minWidth),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < itemWidgets.length; i++) ...[
                if (i != 0) const RioDivider(),
                itemWidgets[i],
              ],
            ],
          ),
        ),
      );
    },
  );
}
