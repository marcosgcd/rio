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
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13ProMax,
          ],
          initialDevice: Devices.ios.iPhone13ProMax,
        ),
      ],
      integrations: [
        // To make addons & knobs work with Widgetbook Cloud
        WidgetbookCloudIntegration(),
      ],

      appBuilder: (context, child) {
        return MaterialApp(
          title: "Rio",
          debugShowCheckedModeBanner: false,
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
