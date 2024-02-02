import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Checkbox',
  type: RioCheckbox,
  path: "inputs",
)
Widget useCaseRioCeckbox(BuildContext context) {
  return const _CheckBoxUseCase();
}

class _CheckBoxUseCase extends StatefulWidget {
  const _CheckBoxUseCase();

  @override
  State<_CheckBoxUseCase> createState() => __CheckBoxUseCaseState();
}

class __CheckBoxUseCaseState extends State<_CheckBoxUseCase> {
  bool? _value = false;

  void _onChanged(bool? value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = Text(
      context.knobs.string(label: "Label", initialValue: "Hello World"),
    );

    final gap = context.knobs.double
        .slider(label: "Gap", initialValue: 16, max: 32, min: 0);
    final margin = EdgeInsets.all(
      context.knobs.double
          .slider(label: "Margin", initialValue: 8, max: 16, min: 0),
    );

    final borderRadius = BorderRadius.circular(
      context.knobs.double
          .slider(label: "Border radius", initialValue: 5, min: 0, max: 16),
    );

    final theme = RioCheckboxTheme(
      margin: margin,
      borderRadius: borderRadius,
      gap: gap,
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RioCheckbox(
              theme: theme,
              label: text,
              onChanged: _onChanged,
              value: _value,
            ),
            RioCheckbox(
              theme: theme,
              label: const Text("Tristate"),
              onChanged: _onChanged,
              value: _value,
              tristate: true,
            ),
            RioCheckbox(
              theme: theme,
              label: const Text("Disabled"),
              disabled: true,
              onChanged: _onChanged,
              value: _value,
            ),
          ],
        ),
      ),
    );
  }
}
