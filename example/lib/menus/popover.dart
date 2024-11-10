import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioPopover,
  path: "menus",
)
Widget useCaseRioPopover(BuildContext context) {
  return Scaffold(body: Center(child: RioPopover()));
}

class RioPopover extends StatelessWidget {
  RioPopover({Key? key}) : super(key: key);
  final _popOverTarget = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
            "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
        RioButton(
          key: _popOverTarget,
          onPressedAwaitMode: RioButtonOnPressedAwaitMode.highlight,
          onPressed: () async {
            await showRioPopover(
              _popOverTarget.currentContext!,
              theme: const RioPopoverTheme(
                padding: EdgeInsets.all(16),
              ),
              bodyBuilder: (context) => RioButton(
                theme: const RioButtonTheme(
                  variant: RioButtonVariant.plain,
                ),
                child: const Text("Test"),
                onPressed: () {},
              ),
            );
          },
          child: const Text("Open Popover"),
        ),
        const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
            "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
      ],
    );
  }
}
