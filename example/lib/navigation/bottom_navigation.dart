import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Fixed',
  type: RioBottomNavigation,
  path: "navigation",
)
Widget useCaseRioBottomNavigationFixed(BuildContext context) {
  return const _Example(
    variant: RioBottomNavigationVariant.fixed,
  );
}

@widgetbook.UseCase(
  name: 'Floating',
  type: RioBottomNavigation,
  path: "navigation",
)
Widget useCaseRioBottomNavigationFloating(BuildContext context) {
  return const _Example(
    variant: RioBottomNavigationVariant.floating,
  );
}

class _Example extends StatefulWidget {
  const _Example({Key? key, required this.variant}) : super(key: key);
  final RioBottomNavigationVariant variant;

  @override
  State<_Example> createState() => __ExampleState();
}

class __ExampleState extends State<_Example> {
  int _curentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: ListView.builder(
        itemBuilder: (context, index) {
          final color = index.isEven
              ? null
              : RioTheme.of(context).colorScheme.primary.withOpacity(0.05);
          return ListTile(
            tileColor: color,
            title: Text('Lorem impsum dolor met jest afned kek $index'),
          );
        },
      ),
      bottomNavigationBar: RioBottomNavigation(
        currentIndex: _curentIndex,
        items: [
          RioNavigationItem(
            label: 'Home',
            icon: const Icon(Icons.home),
          ),
          RioNavigationItem(
            label: 'Search',
            icon: const Icon(Icons.search),
          ),
          RioNavigationItem(
            label: 'Profile',
            icon: const Icon(Icons.person),
          ),
          RioNavigationItem(
            label: 'Settings',
            icon: const Icon(Icons.settings),
          ),
        ],
        onChange: (value) {
          setState(() {
            _curentIndex = value;
          });
        },
        theme: RioBottomNavigationTheme(
          variant: widget.variant,
        ),
      ),
    );
  }
}
