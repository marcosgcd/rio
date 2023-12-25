import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioDivider,
  path: "Display",
)
Widget useCaseRioDivider(BuildContext context) {
  return const Scaffold(
    body: Center(
      child: RioDivider(
        child: Text("Or"),
      ),
    ),
  );
}
