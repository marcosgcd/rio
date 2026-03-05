import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioSliverAppBar,
  path: 'Display',
)
Widget useCaseRioSliverAppBar(BuildContext context) {
  return Scaffold(
    body: CustomScrollView(
      slivers: [
        RioSliverAppBar(
          flexibleSpace: const FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(bottom: 16),
            centerTitle: true,
            title: Text('RioSliverAppBar'),
          ),
          actions: [
            RioIconButton(
              theme: const RioIconButtonTheme(
                variant: RioButtonVariant.plain,
              ),
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        const SliverFillRemaining(
          child: Center(
            child: Text('Scroll content'),
          ),
        ),
      ],
    ),
  );
}
