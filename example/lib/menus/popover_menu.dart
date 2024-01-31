import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioMenu,
  path: "menus",
)
Widget useCaseRioPopover(BuildContext context) {
  return Scaffold(body: Center(child: RioMenu()));
}

class RioMenu extends StatelessWidget {
  RioMenu({Key? key}) : super(key: key);
  final _popOverTarget = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RioButton(
      key: _popOverTarget,
      onPressed: () async {
        final result = await showRioMenu<String>(
          context,
          items: [
            RioMenuItem(
              value: "Test 1",
              title: const Text("Test 1"),
            ),
            RioMenuItem(
              value: "Test 2",
              title: const Text("Marcos"),
              icon: const Icon(Icons.person),
            ),
            RioMenuItem(
              value: "Delete",
              title: const Text("Delete"),
              icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
            ),
          ],
        );
        debugPrint(result);
      },
      child: const Text("Open menu"),
    );
  }
}
