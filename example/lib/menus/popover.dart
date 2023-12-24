import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioPopover,
  path: "menus",
)
Widget useCaseCrPopover(BuildContext context) {
  return Scaffold(body: Center(child: RioPopover()));
}

class RioPopover extends StatelessWidget {
  RioPopover({Key? key}) : super(key: key);
  final _popOverTarget = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RioButton(
      key: _popOverTarget,
      onPressedAwaitMode: RioButtonOnPressedAwaitMode.highlight,
      onPressed: () async {
        await showRioPopover(
          context,
          theme: const RioPopoverTheme(
            padding: EdgeInsets.all(16),
          ),
          bodyBuilder: (context) => RioButton(
            child: const Text("Test"),
            onPressed: () {},
          ),
        );
      },
      child: const Text("Open Popover"),
    );
  }
}
