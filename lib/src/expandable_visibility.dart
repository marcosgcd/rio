import 'package:flutter/material.dart';

class RioExpandableVisibility extends StatefulWidget {
  const RioExpandableVisibility({
    super.key,
    required this.expanded,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutCubic,
    this.reverseCurve = Curves.easeInCubic,
    this.alignment = Alignment.center,
    this.expand = true,
    this.fade = true,
    this.maintainState = true,
  });

  final bool expanded;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Curve reverseCurve;
  final Alignment alignment;
  final bool expand;
  final bool fade;
  final bool maintainState;

  @override
  State<RioExpandableVisibility> createState() =>
      _RioExpandableVisibilityState();
}

class _RioExpandableVisibilityState extends State<RioExpandableVisibility>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: widget.expanded ? 1 : 0,
    );
    _rebuildAnimation();
  }

  @override
  void didUpdateWidget(covariant RioExpandableVisibility oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }

    if (oldWidget.curve != widget.curve ||
        oldWidget.reverseCurve != widget.reverseCurve) {
      _rebuildAnimation();
    }

    if (widget.expanded != oldWidget.expanded) {
      if (widget.expanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  void _rebuildAnimation() {
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
      reverseCurve: widget.reverseCurve,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shouldPaint = widget.expanded || _controller.value > 0;
    if (!shouldPaint && !widget.maintainState) {
      return const SizedBox.shrink();
    }

    return ClipRect(
      child: AnimatedBuilder(
        animation: _animation,
        child: widget.maintainState
            ? IgnorePointer(
                ignoring: !widget.expanded,
                child: widget.child,
              )
            : widget.child,
        builder: (context, child) {
          final value = _animation.value;
          final opacity = widget.fade ? value : (widget.expanded ? 1.0 : 0.0);
          return Align(
            alignment: widget.alignment,
            heightFactor: widget.expand ? value : null,
            child: Opacity(
              opacity: opacity,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
