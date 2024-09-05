import 'package:flutter/material.dart';

class RioDivider extends StatelessWidget {
  const RioDivider({
    super.key,
    this.child,
    this.direction = Axis.horizontal,
  });
  final Widget? child;
  final Axis direction;

  const RioDivider.horizontal({
    super.key,
    this.child,
  }) : direction = Axis.horizontal;

  const RioDivider.vertical({
    super.key,
    this.child,
  }) : direction = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    final divider = direction == Axis.horizontal
        ? const Divider(height: 1)
        : const VerticalDivider(width: 1);

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
