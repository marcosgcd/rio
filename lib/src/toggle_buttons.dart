import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rio/rio.dart';

import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'toggle_buttons.tailor.dart';

@TailorMixinComponent()
class RioToggleButtonsTheme extends ThemeExtension<RioToggleButtonsTheme>
    with DiagnosticableTreeMixin, _$RioToggleButtonsThemeTailorMixin {
  const RioToggleButtonsTheme({
    this.margin,
    this.borderRadius,
    this.color,
    this.borderSide,
    this.selectedColor,
  });

  const RioToggleButtonsTheme.defaultTheme()
      : margin = EdgeInsets.zero,
        borderRadius = null,
        borderSide = null,
        color = null,
        selectedColor = null;

  @override
  final EdgeInsets? margin;
  @override
  final BorderRadius? borderRadius;
  @override
  final BorderSide? borderSide;
  @override
  final Color? color;
  @override
  final Color? selectedColor;

  RioToggleButtonsTheme merge(RioToggleButtonsTheme? other) {
    return const RioToggleButtonsTheme.defaultTheme().copyWith(
      margin: other?.margin ?? margin,
      borderRadius: other?.borderRadius ?? borderRadius,
      borderSide: other?.borderSide ?? borderSide,
      color: other?.color ?? color,
      selectedColor: other?.selectedColor ?? selectedColor,
    );
  }
}

enum RioToggleButtonsVariant {
  solid,
  soft,
}

final _variantMap = {
  RioToggleButtonsVariant.solid: RioButtonVariant.solid,
  RioToggleButtonsVariant.soft: RioButtonVariant.soft,
};

const _oneRadius = Radius.circular(1);

abstract class RioToggleButtonsItem<T> {
  const RioToggleButtonsItem({
    required this.value,
    this.disabled = false,
  });
  final T value;
  final bool disabled;

  Widget build(
    BuildContext context, {
    required RioToggleButtonsTheme theme,
    required bool isSelected,
    required BorderRadiusGeometry? borderRadius,
    required FutureOr<void> Function()? onPressed,
    required RioToggleButtonsVariant variant,
  });
}

class RioToggleButtonsButton<T> extends RioToggleButtonsItem<T> {
  const RioToggleButtonsButton({
    required this.label,
    required super.value,
    super.disabled,
    this.leading,
    this.trailing,
    this.buttonTheme,
  });

  final Widget label;
  final Widget? leading;
  final Widget? trailing;
  final RioButtonTheme? buttonTheme;

  @override
  Widget build(
    BuildContext context, {
    required RioToggleButtonsTheme theme,
    required bool isSelected,
    required BorderRadiusGeometry? borderRadius,
    required FutureOr<void> Function()? onPressed,
    required RioToggleButtonsVariant variant,
  }) {
    final selectedVariant = _variantMap[variant]!;
    final buttonTheme = this.buttonTheme ?? RioTheme.of(context).buttonTheme;

    final selectedColor =
        theme.selectedColor ?? RioTheme.of(context).colorScheme.primary;
    final color = theme.color ?? RioTheme.of(context).colorScheme.onSurface;

    return RioButton(
      disabled: disabled,
      leading: leading,
      trailing: trailing,
      theme: buttonTheme.copyWith(
        variant: isSelected ? selectedVariant : RioButtonVariant.plain,
        borderRadius: borderRadius,
        color: isSelected ? selectedColor : color,
      ),
      onPressed: onPressed,
      child: label,
    );
  }
}

class RioToggleButtonsIconButton<T> extends RioToggleButtonsItem<T> {
  const RioToggleButtonsIconButton({
    required this.icon,
    required super.value,
    super.disabled,
    this.iconButtonTheme,
  });

  final Widget icon;
  final RioIconButtonTheme? iconButtonTheme;

  @override
  Widget build(
    BuildContext context, {
    required RioToggleButtonsTheme theme,
    required bool isSelected,
    required BorderRadiusGeometry? borderRadius,
    required FutureOr<void> Function()? onPressed,
    required RioToggleButtonsVariant variant,
  }) {
    final selectedVariant = _variantMap[variant]!;
    final buttonTheme =
        this.iconButtonTheme ?? RioTheme.of(context).iconButtonTheme;

    final selectedColor =
        theme.selectedColor ?? RioTheme.of(context).colorScheme.primary;
    final color = theme.color ?? RioTheme.of(context).colorScheme.onSurface;

    return RioIconButton(
      disabled: disabled,
      theme: buttonTheme.copyWith(
        variant: isSelected ? selectedVariant : RioButtonVariant.plain,
        borderRadius: borderRadius,
        color: isSelected ? selectedColor : color,
      ),
      onPressed: onPressed,
      icon: icon,
    );
  }
}

class RioToggleButtons<T> extends StatelessWidget {
  const RioToggleButtons({
    super.key,
    required this.items,
    required this.onChanged,
    this.theme,
    this.variant = RioToggleButtonsVariant.solid,
    this.direction = Axis.horizontal,
    required this.selected,
  });
  final RioToggleButtonsVariant variant;
  final RioToggleButtonsTheme? theme;
  final List<RioToggleButtonsItem> items;
  final List<T> selected;
  final Axis direction;
  final ValueChanged<List<T>> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = RioTheme.of(context).toggleButtonsTheme.merge(this.theme);

    final borderRadius = theme.borderRadius ??
        BorderRadius.circular(RioTheme.of(context).defaultBorderRadius);

    final borderColor = theme.borderSide?.color ??
        RioTheme.of(context).colorScheme.onSurface.withOpacity(0.2);
    final border = Border.all(
      color: borderColor,
      style: theme.borderSide?.style ?? BorderStyle.solid,
      width: theme.borderSide?.width ?? 1,
      strokeAlign:
          theme.borderSide?.strokeAlign ?? BorderSide.strokeAlignInside,
    );

    final divider = direction == Axis.vertical
        ? Divider(color: borderColor, height: 1, thickness: 1)
        : VerticalDivider(color: borderColor, width: 1, thickness: 1);

    final List<Widget> buttons = [];

    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      final isFirst = i == 0;
      final isLast = i == items.length - 1;
      final isSelected = selected.contains(item.value);

      BorderRadiusGeometry? itemBorderRadius;
      if (direction == Axis.horizontal) {
        itemBorderRadius = BorderRadius.only(
          topLeft: isFirst ? borderRadius.topLeft - _oneRadius : Radius.zero,
          bottomLeft:
              isFirst ? borderRadius.bottomLeft - _oneRadius : Radius.zero,
          topRight: isLast ? borderRadius.topRight - _oneRadius : Radius.zero,
          bottomRight:
              isLast ? borderRadius.bottomRight - _oneRadius : Radius.zero,
        );
      } else {
        itemBorderRadius = BorderRadius.only(
          topLeft: isFirst ? borderRadius.topLeft - _oneRadius : Radius.zero,
          topRight: isFirst ? borderRadius.topRight - _oneRadius : Radius.zero,
          bottomLeft:
              isLast ? borderRadius.bottomLeft - _oneRadius : Radius.zero,
          bottomRight:
              isLast ? borderRadius.bottomRight - _oneRadius : Radius.zero,
        );
      }

      final button = item.build(
        context,
        theme: theme,
        variant: variant,
        borderRadius: itemBorderRadius,
        isSelected: isSelected,
        onPressed: () {
          if (selected.contains(item.value)) {
            onChanged(selected.where((e) => e != item.value).toList());
          } else {
            onChanged([...selected, item.value]);
          }
        },
      );

      buttons.add(button);

      if (!isLast) {
        buttons.add(divider);
      }
    }

    Widget buttonsContainer = Flex(
      direction: direction,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buttons,
    );

    if (direction == Axis.horizontal) {
      buttonsContainer = IntrinsicHeight(
        child: buttonsContainer,
      );
    } else {
      buttonsContainer = IntrinsicWidth(
        child: buttonsContainer,
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: theme.margin,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius,
      ),
      child: buttonsContainer,
    );
  }
}
