import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioToolbar,
  path: "menus",
)
Widget useCaseRioToolbarDefault(BuildContext context) {
  final width = context.knobs.double
      .slider(label: "Container Width", initialValue: 300, max: 600, min: 50);

  final items = [
    RioToolbarItemButton(
      action: () {},
      label: const Text("Test 1"),
      icon: const Icon(Icons.add),
    ),
    RioToolbarItemButton(
      action: () {},
      label: const Text("Test 2"),
      icon: const Icon(Icons.star),
    ),
    RioToolbarItemButton(
      action: () {},
      label: const Text("Test 3"),
      icon: const Icon(Icons.favorite),
    ),
    RioToolbarItemIconButton(
      action: () {},
      label: const Text("Test 4"),
      icon: const Icon(Icons.car_crash),
    ),
    RioToolbarItemButton(
      action: () {},
      label: const Text("Test 5"),
      icon: const Icon(Icons.place_outlined),
    ),
  ];

  return Scaffold(
    body: Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: RioTheme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.1),
          ),
        ),
        width: width,
        child: RioToolbar(items: items),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Custom',
  type: RioToolbar,
  path: "menus",
)
Widget useCaseRioToolbarCustom(BuildContext context) {
  final width = context.knobs.double
      .slider(label: "Container Width", initialValue: 300, max: 600, min: 50);

  final itemsTheme = RioButtonTheme(
    color: RioTheme.of(context).colorScheme.primary,
    variant: RioButtonVariant.plain,
    borderRadius: BorderRadius.zero,
  );
  final items = [
    RioToolbarItemButton(
      action: () {},
      label: const Text("Test 1"),
      icon: const Icon(Icons.add),
      buttonTheme: itemsTheme,
    ),
    RioToolbarItemButton(
      action: () {},
      label: const Text("Test 2"),
      icon: const Icon(Icons.star),
      buttonTheme: itemsTheme,
    ),
    RioToolbarItemButton(
      action: () {},
      label: const Text("Test 3"),
      icon: const Icon(Icons.favorite),
      buttonTheme: itemsTheme,
    ),
    RioToolbarItemButton(
      action: () {},
      label: const Text("Test 5"),
      icon: const Icon(Icons.place_outlined),
      buttonTheme: itemsTheme,
    ),
  ];

  return Scaffold(
    body: Center(
      child: SizedBox(
        width: width,
        child: Row(
          children: [
            Flexible(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: RioTheme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(
                    RioTheme.of(context).defaultBorderRadius,
                  ),
                ),
                child: RioToolbar(
                  items: items,
                  moreButtonTheme: RioIconButtonTheme(
                    color: RioTheme.of(context).colorScheme.primary,
                    variant: RioButtonVariant.plain,
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
