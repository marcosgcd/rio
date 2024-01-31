import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Color Scheme',
  type: RioColorScheme,
  path: "core",
)
Widget colorSchemeUseCase(BuildContext context) {
  final colorScheme = RioTheme.of(context).colorScheme;

  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Color Scheme",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ..._buildColorDisplay(
              color: colorScheme.background,
              titleColor: colorScheme.onBackground,
              onColor: colorScheme.onBackground,
              colorName: "Background",
              children: [
                const SizedBox(height: 16),
                ..._buildColorDisplay(
                  color: colorScheme.primary,
                  onColor: colorScheme.onPrimary,
                  titleColor: colorScheme.onBackground,
                  colorName: "Primary",
                ),
                ..._buildColorDisplay(
                  color: colorScheme.surface,
                  onColor: colorScheme.onSurface,
                  titleColor: colorScheme.onBackground,
                  colorName: "Surface",
                  children: [
                    const SizedBox(height: 16),
                    ..._buildColorDisplay(
                      color: colorScheme.primary,
                      onColor: colorScheme.onPrimary,
                      titleColor: colorScheme.onSurface,
                      colorName: "Primary",
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ..._buildColorDisplay(
                  color: colorScheme.popover,
                  onColor: colorScheme.onPopover,
                  titleColor: colorScheme.onPopover,
                  colorName: "Popover",
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

List<Widget> _buildColorDisplay({
  required String colorName,
  required Color titleColor,
  required Color onColor,
  required Color color,
  List<Widget> children = const [],
}) {
  return [
    Text(colorName, style: TextStyle(fontSize: 24, color: titleColor)),
    const SizedBox(height: 4),
    Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "on $colorName",
            style: TextStyle(
              color: onColor,
              fontSize: 16,
            ),
          ),
          ...children,
        ],
      ),
    ),
    const SizedBox(height: 16),
  ];
}
