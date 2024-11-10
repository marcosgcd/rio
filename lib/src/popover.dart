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
    this.containerTheme,
    this.barrierColor,
    this.padding,
    this.borderRadius,
  });

  const RioPopoverTheme.defaultTheme()
      : containerTheme = null,
        barrierColor = Colors.transparent,
        padding = EdgeInsets.zero,
        borderRadius = null;

  @override
  final RioContainerTheme? containerTheme;
  @override
  final Color? barrierColor;
  @override
  final EdgeInsets? padding;
  @override
  final double? borderRadius;

  RioPopoverTheme merge(RioPopoverTheme? other) {
    return const RioPopoverTheme.defaultTheme().copyWith(
      containerTheme: other?.containerTheme ?? containerTheme,
      barrierColor: other?.barrierColor ?? barrierColor,
      padding: other?.padding ?? padding,
      borderRadius: other?.borderRadius ?? borderRadius,
    );
  }
}

typedef RioPopoverDirection = popover.PopoverDirection;

Future<T?> showRioPopover<T>(
  BuildContext context, {
  required Widget Function(BuildContext context) bodyBuilder,
  RioPopoverDirection direction = RioPopoverDirection.bottom,
  RioPopoverTheme? theme,
  Offset? offset,
}) async {
  var popoverTheme = RioTheme.of(context).popoverTheme.merge(theme);

  final containerTheme = popoverTheme.containerTheme ??
      RioTheme.of(context).containerTheme.copyWith(
            color: RioTheme.of(context).colorScheme.popover,
          );

  popoverTheme = popoverTheme.copyWith(
    containerTheme: containerTheme,
    borderRadius:
        popoverTheme.borderRadius ?? RioTheme.of(context).defaultBorderRadius,
  );

  return popover.showPopover<T>(
    context: context,
    direction: direction,
    barrierColor: popoverTheme.barrierColor!,
    arrowHeight: 0,
    arrowWidth: 0,
    contentDxOffset: offset?.dx ?? 0,
    contentDyOffset: offset?.dy ?? 0,
    backgroundColor: Colors.transparent,
    radius: popoverTheme.borderRadius!,
    bodyBuilder: (_) => Theme(
      data: Theme.of(context),
      child: Builder(
        builder: (context) {
          return RioContainer(
            theme: popoverTheme.containerTheme,
            child: DefaultTextStyle(
              style: TextStyle(
                color: RioTheme.of(context).colorScheme.onPopover,
              ),
              child: Padding(
                padding: popoverTheme.padding!,
                child: bodyBuilder(context),
              ),
            ),
          );
        },
      ),
    ),
  );
}
