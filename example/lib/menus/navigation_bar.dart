import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Horizontal',
  type: RioNavigationBar,
  path: "menus",
)
Widget useCaseHorizontal(BuildContext context) {
  return _useCase(context, Axis.horizontal);
}

@widgetbook.UseCase(
  name: 'Vertical',
  type: RioNavigationBar,
  path: "menus",
)
Widget useCaseVertical(BuildContext context) {
  return _useCase(context, Axis.vertical);
}

Widget _useCase(BuildContext context, Axis direction) {
  var theme = const RioNavigationBarTheme.defaultVerticalTheme();

  theme = theme.copyWith(
    padding: EdgeInsets.all(
      context.knobs.double
          .slider(label: "Padding", initialValue: 0, min: 0, max: 16),
    ),
  );

  return Scaffold(
    body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Flex(
        direction: direction,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: RioNavigationBar(
                theme: theme,
                direction: direction,
                items: const [
                  RioNavigationBarItem.item(
                    icon: Icons.home,
                    label: 'Home',
                  ),
                  RioNavigationBarItem.item(
                    icon: Icons.search,
                    label: 'Search',
                  ),
                  RioNavigationBarItem.item(
                    icon: Icons.notifications,
                    label: 'Notifications Long Text',
                  ),
                  RioNavigationBarItem.divider(
                    paddingHorizontal:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    paddingVertical:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                  RioNavigationBarItem.spacer(),
                  RioNavigationBarItem.item(
                    icon: Icons.person,
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
