import 'package:flutter/material.dart';

class RioDivider extends StatelessWidget {
  const RioDivider({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    const divider = Divider(height: 1);
    if (child == null) return divider;
    return Row(
      children: [
        const Expanded(child: divider),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: child,
        ),
        const Expanded(child: divider),
      ],
    );
  }
}
