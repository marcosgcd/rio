import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioIconMerger,
  path: "Display",
)
Widget useCaseRioIconMerger(BuildContext context) {
  final size = context.knobs.double
      .slider(label: "Size", initialValue: 50, max: 128, min: 24);

  return Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RioIconMerger(
            icon: Icons.folder,
            subIcon: Icons.add,
            size: size,
          ),
          RioIconMerger(
            icon: Icons.upload,
            subIcon: Icons.auto_awesome,
            size: size,
          ),
          RioIconMerger(
            icon: Icons.download,
            subIcon: Icons.add,
            size: size,
          ),
        ],
      ),
    ),
  );
}
