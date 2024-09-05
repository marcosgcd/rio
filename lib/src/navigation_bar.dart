import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rio/rio.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'navigation_bar.tailor.dart';
part 'navigation_bar.freezed.dart';

@freezed
sealed class RioNavigationBarItem with _$RioNavigationBarItem {
  const factory RioNavigationBarItem.item({
    required IconData icon,
    required String label,
    RioButtonTheme? theme,
    @Default(false) bool selected,
    VoidCallback? onPressed,
  }) = RioNavigationBarItemItem;
  const factory RioNavigationBarItem.spacer({
    @Default(1) int flex,
  }) = RioNavigationBarItemSpacer;
  const factory RioNavigationBarItem.divider({
    @Default(EdgeInsets.zero) EdgeInsetsGeometry paddingVertical,
    @Default(EdgeInsets.zero) EdgeInsetsGeometry paddingHorizontal,
  }) = RioNavigationBarItemDivider;
  const factory RioNavigationBarItem.custom(Widget child) =
      RioNavigationBarItemCustom;
}

@TailorMixinComponent()
class RioNavigationBarTheme extends ThemeExtension<RioNavigationBarTheme>
    with DiagnosticableTreeMixin, _$RioNavigationBarThemeTailorMixin {
  const RioNavigationBarTheme({
    this.size,
    this.margin,
    this.padding,
    this.gap,
    this.borderRadius,
    this.border,
    this.color,
    this.itemIconSize,
    this.itemTextStyle,
    this.containerTheme,
  });

  const RioNavigationBarTheme.defaultVerticalTheme()
      : size = 100,
        margin = EdgeInsets.zero,
        padding = EdgeInsets.zero,
        gap = 2,
        border = null,
        color = null,
        borderRadius = null,
        containerTheme = null,
        itemIconSize = 32,
        itemTextStyle = const TextStyle(fontSize: 10);

  const RioNavigationBarTheme.defaultHorizontalTheme()
      : size = 64,
        margin = EdgeInsets.zero,
        padding = EdgeInsets.zero,
        gap = 2,
        border = null,
        color = null,
        borderRadius = null,
        containerTheme = null,
        itemIconSize = 32,
        itemTextStyle = const TextStyle(fontSize: 10);

  @override
  final double? size;
  @override
  final EdgeInsets? margin;
  @override
  final EdgeInsets? padding;
  @override
  final double? gap;
  @override
  final BorderRadiusGeometry? borderRadius;
  @override
  final BoxBorder? border;
  @override
  final Color? color;
  @override
  final double? itemIconSize;
  @override
  final TextStyle? itemTextStyle;
  @override
  final RioContainerTheme? containerTheme;

  RioNavigationBarTheme merge(RioNavigationBarTheme? other, Axis direction) {
    final defaultTheme = direction == Axis.horizontal
        ? const RioNavigationBarTheme.defaultHorizontalTheme()
        : const RioNavigationBarTheme.defaultVerticalTheme();

    return defaultTheme.copyWith(
      size: other?.size ?? size,
      margin: other?.margin ?? margin,
      padding: other?.padding ?? padding,
      gap: other?.gap ?? gap,
      borderRadius: other?.borderRadius ?? borderRadius,
      border: other?.border ?? border,
      color: other?.color ?? color,
      itemIconSize: other?.itemIconSize ?? itemIconSize,
      itemTextStyle: other?.itemTextStyle ?? itemTextStyle,
      containerTheme: other?.containerTheme ?? containerTheme,
    );
  }
}

class RioNavigationBar extends StatelessWidget {
  const RioNavigationBar({
    super.key,
    this.theme,
    required this.items,
    this.direction = Axis.horizontal,
  });

  final RioNavigationBarTheme? theme;
  final List<RioNavigationBarItem> items;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    final theme = (direction == Axis.horizontal
            ? RioTheme.of(context).navigationBarHorizontalTheme
            : RioTheme.of(context).navigationBarVerticalTheme)
        .merge(this.theme, direction);

    List<Widget> children =
        items.map((item) => _buildItem(context, item, theme)).toList();

    final containerTheme = RioContainerTheme(
      color: theme.color,
      borderRadius: theme.borderRadius,
      padding: theme.padding,
      margin: theme.margin,
    ).merge(theme.containerTheme);

    return RioContainer(
      width: direction == Axis.horizontal ? null : theme.size,
      height: direction == Axis.horizontal ? theme.size : null,
      theme: containerTheme,
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: direction,
        children: children,
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    RioNavigationBarItem item,
    RioNavigationBarTheme theme,
  ) {
    final isFirst = item == items.first;
    final margin = switch (direction) {
      Axis.horizontal => EdgeInsets.only(left: isFirst ? 0 : theme.gap!),
      Axis.vertical => EdgeInsets.only(top: isFirst ? 0 : theme.gap!)
    };
    switch (item) {
      case RioNavigationBarItemItem():
        final colorScheme = RioTheme.of(context).colorScheme;
        final selected = item.selected;

        final buttonTheme = item.theme ??
            RioButtonTheme(
              gap: 2,
              padding: const EdgeInsets.all(8),
              margin: margin,
              variant:
                  selected ? RioButtonVariant.soft : RioButtonVariant.plain,
              color: selected ? colorScheme.primary : colorScheme.caption,
            );

        return SizedBox(
          width: theme.size,
          height: theme.size,
          child: RioButton(
            theme: buttonTheme,
            onPressed: item.onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  size: theme.itemIconSize,
                ),
                SizedBox(height: theme.gap),
                Text(
                  item.label,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: theme.itemTextStyle,
                ),
              ],
            ),
          ),
        );
      case RioNavigationBarItemSpacer():
        return Spacer(flex: item.flex);
      case RioNavigationBarItemDivider():
        final divider = switch (direction) {
          Axis.horizontal => const RioDivider.vertical(),
          Axis.vertical => const RioDivider.horizontal(),
        };
        final padding = switch (direction) {
          Axis.horizontal => item.paddingHorizontal,
          Axis.vertical => item.paddingVertical,
        };

        return Container(
          margin: margin,
          padding: padding,
          child: divider,
        );

      case RioNavigationBarItemCustom():
        return item.child;
    }
  }
}
