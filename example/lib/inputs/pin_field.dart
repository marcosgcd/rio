import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioPinField,
  path: "inputs",
)
Widget useCaseRioPinField(BuildContext context) {
  final count = context.knobs.int
      .slider(label: "Count", initialValue: 6, max: 10, min: 2);

  final margin = EdgeInsets.all(
    context.knobs.double
        .slider(label: "Margin", initialValue: 4, max: 16, min: 0),
  );
  final borderRadius = BorderRadius.circular(
    context.knobs.double
        .slider(label: "Border radius", initialValue: 10, min: 0, max: 16),
  );

  final color = context.knobs.colorOrNull(label: "Color", initialValue: null);

  final theme = RioPinFieldTheme(
    margin: margin,
    color: color,
    borderRadius: borderRadius,
  );

  return Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RioPinField(
            count: count,
            theme: theme,
          ),
          RioPinField(
            disabled: true,
            count: count,
            theme: theme,
          ),
        ],
      ),
    ),
  );
}
