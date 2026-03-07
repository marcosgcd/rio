import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioSettingsSection,
  path: 'Display',
)
Widget useCaseRioSettings(BuildContext context) {
  return Scaffold(
    body: CustomScrollView(
      slivers: [
        const RioSliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(bottom: 16),
            centerTitle: true,
            title: Text('Settings'),
          ),
          useGlassContainer: false,
        ),
        RioSettingsSection(
          title: const Text('General'),
          children: [
            RioSettingsTile(
              label: const Text('Language'),
              trailing: const Text('de'),
              onPressed: () {},
            ),
            RioSettingsTile(
              label: const Text('Theme'),
              caption: 'System default',
              onPressed: () {},
            ),
          ],
        ),
      ],
    ),
  );
}
