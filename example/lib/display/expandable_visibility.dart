import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioExpandableVisibility,
  path: "Display",
)
Widget useCaseRioExpandableVisibility(BuildContext context) {
  final expand = context.knobs.boolean(label: "Expand", initialValue: true);
  final fade = context.knobs.boolean(label: "Fade", initialValue: true);
  final maintainState =
      context.knobs.boolean(label: "Maintain State", initialValue: true);
  final initiallyExpanded =
      context.knobs.boolean(label: "Initially Expanded", initialValue: false);
  final durationMs = context.knobs.double.slider(
    label: "Duration (ms)",
    initialValue: 220,
    min: 80,
    max: 800,
  );

  return Scaffold(
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: _ExpandableVisibilityDemo(
            expand: expand,
            fade: fade,
            maintainState: maintainState,
            initiallyExpanded: initiallyExpanded,
            duration: Duration(milliseconds: durationMs.round()),
          ),
        ),
      ),
    ),
  );
}

class _ExpandableVisibilityDemo extends StatefulWidget {
  const _ExpandableVisibilityDemo({
    required this.expand,
    required this.fade,
    required this.maintainState,
    required this.initiallyExpanded,
    required this.duration,
  });

  final bool expand;
  final bool fade;
  final bool maintainState;
  final bool initiallyExpanded;
  final Duration duration;

  @override
  State<_ExpandableVisibilityDemo> createState() =>
      _ExpandableVisibilityDemoState();
}

class _ExpandableVisibilityDemoState extends State<_ExpandableVisibilityDemo> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
  }

  @override
  void didUpdateWidget(covariant _ExpandableVisibilityDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initiallyExpanded != widget.initiallyExpanded) {
      _expanded = widget.initiallyExpanded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = RioTheme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RioButton(
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            child: Text(_expanded ? "Collapse" : "Expand"),
          ),
          const SizedBox(height: 12),
          RioExpandableVisibility(
            expanded: _expanded,
            duration: widget.duration,
            expand: widget.expand,
            fade: widget.fade,
            maintainState: widget.maintainState,
            alignment: Alignment.topCenter,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colors.border),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Expandable content"),
                    const SizedBox(height: 8),
                    Text(
                      "Use \"Expand\" for height animation and \"Fade\" for opacity. "
                      "Maintain State controls whether inner state survives collapse.",
                      style: TextStyle(color: colors.caption),
                    ),
                    const SizedBox(height: 12),
                    const _InnerCounter(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InnerCounter extends StatefulWidget {
  const _InnerCounter();

  @override
  State<_InnerCounter> createState() => _InnerCounterState();
}

class _InnerCounterState extends State<_InnerCounter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text("Inner counter: $_count"),
        ),
        RioButton(
          onPressed: () {
            setState(() {
              _count += 1;
            });
          },
          child: const Text("Increment"),
        ),
      ],
    );
  }
}
