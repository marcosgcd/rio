import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioBottomNavigation,
  path: "menus",
)
Widget useCaseBottomNavigation(BuildContext context) {
  return const _BottomNavigationExample();
}

@widgetbook.UseCase(
  name: 'With Action',
  type: RioBottomNavigation,
  path: "menus",
)
Widget useCaseBottomNavigationWithAction(BuildContext context) {
  return const _BottomNavigationExample(showAction: true);
}

@widgetbook.UseCase(
  name: 'Custom Theme',
  type: RioBottomNavigation,
  path: "menus",
)
Widget useCaseBottomNavigationCustomTheme(BuildContext context) {
  var theme = const RioBottomNavigationTheme.defaultTheme();

  theme = theme.copyWith(
    height: context.knobs.double
        .slider(label: "Height", initialValue: 55, min: 40, max: 80),
    actionButtonSpacing: context.knobs.double.slider(
      label: "Action Button Spacing",
      initialValue: 8,
      min: 0,
      max: 20,
    ),
    animationDuration: Duration(
      milliseconds: context.knobs.double
          .slider(
            label: "Animation Duration (ms)",
            initialValue: 200,
            min: 100,
            max: 1000,
          )
          .round(),
    ),
  );

  return _BottomNavigationExample(
    theme: theme,
    showAction: true,
  );
}

@widgetbook.UseCase(
  name: 'Default Soft Action',
  type: RioBottomNavigation,
  path: "menus",
)
Widget useCaseBottomNavigationDefaultSoft(BuildContext context) {
  return const _BottomNavigationExample(
    showAction: true,
    useDefaultTheme: true,
  );
}

class _BottomNavigationExample extends StatefulWidget {
  const _BottomNavigationExample({
    this.theme,
    this.showAction = false,
    this.useDefaultTheme = false,
  });

  final RioBottomNavigationTheme? theme;
  final bool showAction;
  final bool useDefaultTheme;

  @override
  State<_BottomNavigationExample> createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State<_BottomNavigationExample> {
  int currentIndex = 0;

  final List<RioBottomNavigationItem> items = const [
    RioBottomNavigationItem(
      label: 'Home',
      icon: Icon(Icons.home),
      tooltip: 'Home',
    ),
    RioBottomNavigationItem(
      label: 'Search',
      icon: Icon(Icons.search),
      tooltip: 'Search',
    ),
    RioBottomNavigationItem(
      label: 'Profile',
      icon: Icon(Icons.person),
      tooltip: 'Profile',
    ),
    RioBottomNavigationItem(
      label: 'Settings',
      icon: Icon(Icons.settings),
      tooltip: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Tab: ${items[currentIndex].label}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Index: $currentIndex',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            if (widget.showAction)
              Text(
                'Action button visible on tabs 0, 1, and 2',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: RioTheme.of(context).colorScheme.caption,
                    ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: RioBottomNavigation(
        theme: widget.theme,
        items: items,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        actionBuilder: widget.showAction
            ? (context, index) {
                // Show action button for certain tabs
                if (index == 0 || index == 1 || index == 2) {
                  return RioBottomNavigationAction(
                    onPressed: (context) async {
                      final sfMessage = ScaffoldMessenger.of(context);
                      if (index == 0) {
                        final result = await showRioMenu(
                          context,
                          direction: RioPopoverDirection.top,
                          items: [
                            RioMenuItem<String>(
                              title: const Text("Action 1"),
                              value: "action1",
                            ),
                            RioMenuItem<String>(
                              title: const Text("Action 2"),
                              value: "action2",
                            ),
                          ],
                        );
                        sfMessage.showSnackBar(
                          SnackBar(
                            content: Text(
                              'Action pressed for ${items[index].label}: $result',
                            ),
                          ),
                        );
                      } else {
                        sfMessage.showSnackBar(
                          SnackBar(
                            content: Text(
                              'Action pressed for ${items[index].label}',
                            ),
                          ),
                        );
                      }
                    },
                    tooltip: 'Add ${items[index].label.toLowerCase()}',
                    child: const Icon(Icons.add),
                    // Custom button theme with different variants per tab
                    buttonTheme: RioButtonTheme(
                      color: index == 0
                          ? RioTheme.of(context).colorScheme.primary
                          : index == 1
                              ? Colors.green
                              : Colors.orange,
                    ),
                    // Custom container theme for rounded corners
                    containerTheme: const RioContainerTheme(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  );
                }
                return null; // No action button for settings tab
              }
            : null,
      ),
    );
  }
}
