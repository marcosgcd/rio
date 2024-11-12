import 'package:flutter/material.dart';
import 'package:rio/rio.dart';

class RioDivider extends StatelessWidget {
  const RioDivider({
    super.key,
    this.direction = Axis.horizontal,
    this.color,
    this.child,
  });
  final Widget? child;
  final Axis direction;
  final Color? color;

  const RioDivider.horizontal({
    super.key,
    this.color,
    this.child,
  }) : direction = Axis.horizontal;

  const RioDivider.vertical({
    super.key,
    this.color,
    this.child,
  }) : direction = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? RioTheme.of(context).colorScheme.border;
    final divider = direction == Axis.horizontal
        ? Divider(
            height: 1,
            color: color,
          )
        : VerticalDivider(
            width: 1,
            color: color,
          );

    if (child == null) return divider;

    final padding = direction == Axis.horizontal
        ? const EdgeInsets.symmetric(horizontal: 16)
        : const EdgeInsets.symmetric(vertical: 16);

    return Flex(
      direction: direction,
      children: [
        Expanded(child: divider),
        Padding(
          padding: padding,
          child: child,
        ),
        Expanded(child: divider),
      ],
    );
  }
}
