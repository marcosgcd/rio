import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart' as popover;
import 'package:rio/rio.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'popover.tailor.dart';

@TailorMixinComponent()
class RioPopoverTheme extends ThemeExtension<RioPopoverTheme>
    with DiagnosticableTreeMixin, _$RioPopoverThemeTailorMixin {
  const RioPopoverTheme({
    this.backgroundColor,
    this.barrierColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
    this.borderRadius,
    this.arrowSize = const Size(8, 4),
  });

  @override
  final Color? backgroundColor;
  @override
  final Color barrierColor;
  @override
  final EdgeInsets padding;
  @override
  final double? borderRadius;
  @override
  final Size arrowSize;
}

typedef RioPopoverDirection = popover.PopoverDirection;

Future<T?> showRioPopover<T>(
  BuildContext context, {
  required Widget Function(BuildContext context) bodyBuilder,
  RioPopoverDirection direction = RioPopoverDirection.bottom,
  RioPopoverTheme? theme,
}) async {
  var popoverTheme = theme ?? RioTheme.of(context).popoverTheme;

  popoverTheme = popoverTheme.copyWith(
    backgroundColor: popoverTheme.backgroundColor ??
        RioTheme.of(context).colorScheme.popover,
    borderRadius:
        popoverTheme.borderRadius ?? RioTheme.of(context).defaultBorderRadius,
  );

  return popover.showPopover<T>(
    context: context,
    direction: direction,
    bodyBuilder: (_) => Theme(
      data: Theme.of(context),
      child: Builder(
        builder: (context) {
          return DefaultTextStyle(
            style: TextStyle(
              color: RioTheme.of(context).colorScheme.onPopover,
            ),
            child: Padding(
              padding: popoverTheme.padding,
              child: bodyBuilder(context),
            ),
          );
        },
      ),
    ),
    barrierColor: popoverTheme.barrierColor,
    arrowWidth: popoverTheme.arrowSize.width,
    arrowHeight: popoverTheme.arrowSize.height,
    backgroundColor: popoverTheme.backgroundColor!,
    radius: popoverTheme.borderRadius!,
  );
}
