import 'package:flutter/material.dart';

class RioTooltip extends StatelessWidget {
  const RioTooltip({
    super.key,
    required this.child,
    this.message,
  });
  final Widget child;
  final String? message;

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return child;
    }

    return Tooltip(
      message: message,
      child: child,
    );
  }
}
