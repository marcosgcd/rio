import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioContainer,
  path: 'Display',
)
Widget useCaseRioGlassContainer(BuildContext context) {
  return const Scaffold(
    body: Stack(
      children: [
        Center(
          child: SizedBox(
            width: 260,
            child: Text(
              'RioGlassContainer sample background text used to visualize blur.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Center(
          child: RioContainer.glass(
            width: 220,
            height: 120,
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text('RioContainer.glass'),
            ),
          ),
        ),
      ],
    ),
  );
}
