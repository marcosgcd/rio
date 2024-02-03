import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Solid',
  type: RioToggleButtons,
  path: "inputs",
)
Widget useCaseRioToggleButtonSolid(BuildContext context) {
  return const ToggleButtonsUseCase(variant: RioToggleButtonsVariant.solid);
}

@widgetbook.UseCase(
  name: 'Soft',
  type: RioToggleButtons,
  path: "inputs",
)
Widget useCaseRioToggleButtonSoft(BuildContext context) {
  return const ToggleButtonsUseCase(variant: RioToggleButtonsVariant.soft);
}

class ToggleButtonsUseCase extends StatefulWidget {
  const ToggleButtonsUseCase({super.key, required this.variant});
  final RioToggleButtonsVariant variant;

  @override
  State<ToggleButtonsUseCase> createState() => _ToggleButtonsUseCaseState();
}

class _ToggleButtonsUseCaseState extends State<ToggleButtonsUseCase> {
  List<int> _selected = [];

  @override
  Widget build(BuildContext context) {
    final margin = EdgeInsets.all(
      context.knobs.double
          .slider(label: "Margin", initialValue: 16, max: 32, min: 0),
    );

    final padding = EdgeInsets.symmetric(
      horizontal: context.knobs.double
          .slider(label: "Padding X", initialValue: 16, max: 32, min: 0),
      vertical: context.knobs.double
          .slider(label: "Padding Y", initialValue: 8, max: 16, min: 0),
    );

    final borderRadius = BorderRadius.circular(
      context.knobs.double
          .slider(label: "Border radius", initialValue: 10, min: 0, max: 16),
    );

    final selectedColor = context.knobs.colorOrNull(
      label: "Selected color",
      initialValue: null,
    );

    final color = context.knobs.colorOrNull(
      label: "Color",
      initialValue: null,
    );

    final theme = RioToggleButtonsTheme(
      margin: margin,
      color: color,
      selectedColor: selectedColor,
      borderRadius: borderRadius,
    );

    final buttonTheme = RioButtonTheme(
      padding: padding,
    );
    final iconButtonTheme = RioIconButtonTheme(
      padding: padding,
    );

    final items = [
      RioToggleButtonsButton(
        label: const Text("First"),
        buttonTheme: buttonTheme,
        value: 0,
      ),
      RioToggleButtonsButton(
        label: const Text("Second"),
        disabled: true,
        buttonTheme: buttonTheme,
        value: 1,
      ),
      RioToggleButtonsIconButton(
        icon: const Icon(Icons.star),
        iconButtonTheme: iconButtonTheme,
        value: 2,
      ),
      RioToggleButtonsButton(
        label: const Text("Third"),
        trailing: const Icon(Icons.star),
        buttonTheme: buttonTheme,
        value: 3,
      ),
    ];

    final itemsIconsOnly = [
      RioToggleButtonsIconButton(
        icon: const Icon(Icons.text_decrease),
        iconButtonTheme: iconButtonTheme,
        value: 0,
      ),
      RioToggleButtonsIconButton(
        icon: const Icon(Icons.text_format),
        iconButtonTheme: iconButtonTheme,
        value: 1,
      ),
      RioToggleButtonsIconButton(
        icon: const Icon(Icons.text_increase),
        iconButtonTheme: iconButtonTheme,
        value: 2,
      ),
      RioToggleButtonsIconButton(
        iconButtonTheme: iconButtonTheme,
        icon: const Icon(Icons.format_italic),
        value: 3,
      ),
    ];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RioToggleButtons(
              variant: widget.variant,
              theme: theme,
              items: items,
              selected: _selected,
              onChanged: (value) {
                setState(() {
                  _selected = value;
                });
              },
            ),
            RioToggleButtons(
              variant: widget.variant,
              theme: theme,
              direction: Axis.vertical,
              items: items,
              selected: _selected,
              onChanged: (value) {
                setState(() {
                  _selected = value;
                });
              },
            ),
            RioToggleButtons(
              variant: widget.variant,
              theme: theme,
              items: itemsIconsOnly,
              selected: _selected,
              onChanged: (value) {
                setState(() {
                  _selected = value;
                });
              },
            ),
            RioToggleButtons(
              variant: widget.variant,
              theme: theme,
              direction: Axis.vertical,
              items: itemsIconsOnly,
              selected: _selected,
              onChanged: (value) {
                setState(() {
                  _selected = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
