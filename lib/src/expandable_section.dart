import 'package:flutter/material.dart';

class RioExpandableSection extends StatefulWidget {
  const RioExpandableSection({
    super.key,
    this.expanded = true,
    this.axisAlignment = 0,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeIn,
    this.axis = Axis.vertical,
    required this.child,
    this.fade = false,
    this.initialAnimation = false,
  });
  final Widget child;
  final bool expanded;
  final double axisAlignment;
  final Duration duration;
  final Curve curve;
  final Axis axis;
  final bool fade;
  final bool initialAnimation;

  @override
  State<RioExpandableSection> createState() => _RioExpandableSectionState();
}

class _RioExpandableSectionState extends State<RioExpandableSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
    if (widget.expanded) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  void prepareAnimations() {
    double value = widget.expanded ? 1 : 0;
    if (widget.initialAnimation) {
      value = value == 0 ? 1 : 0;
    }
    expandController = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: value,
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: widget.curve,
    );
  }

  void _runExpandCheck() {
    if (widget.expanded) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(RioExpandableSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    _runExpandCheck();
    expandController.duration = widget.duration;
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final child = SizeTransition(
      axisAlignment: widget.axisAlignment,
      axis: widget.axis,
      sizeFactor: animation,
      child: widget.child,
    );

    if (widget.fade) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }
    return child;
  }
}
