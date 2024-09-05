import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Horizontal',
  type: RioDivider,
  path: "Display",
)
Widget useCaseRioHorizontal(BuildContext context) {
  return const Scaffold(
    body: Center(
      child: RioDivider(
        child: Text("Or"),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Vertical',
  type: RioDivider,
  path: "Display",
)
Widget useCaseRioVertical(BuildContext context) {
  return const Scaffold(
    body: Center(
      child: RioDivider.vertical(
        child: Text("Or"),
      ),
    ),
  );
}
