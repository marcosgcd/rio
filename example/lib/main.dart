import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      // Use the generated directories variable
      directories: directories,
      addons: [
        ZoomAddon(),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13ProMax,
          ],
          initialDevice: Devices.ios.iPhone13ProMax,
        ),
      ],

      appBuilder: (context, child) {
        return MaterialApp(
          title: "Rio",
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: RioTheme(
            colorScheme: RioColorScheme.fromSeed(Colors.green),
          ).toThemeData(),
          darkTheme: RioTheme(
            colorScheme: RioColorScheme.fromSeed(
              Colors.green,
              brightness: Brightness.dark,
            ),
          ).toThemeData(),
          home: Material(
            child: child,
          ),
        );
      },
    );
  }
}
