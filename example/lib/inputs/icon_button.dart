import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Solid',
  type: RioIconButton,
  path: "inputs",
)
Widget useCaseRioIconButtonSolid(BuildContext context) {
  return _buildUseCase(context, variant: RioButtonVariant.solid);
}

@widgetbook.UseCase(
  name: 'Soft',
  type: RioIconButton,
  path: "inputs",
)
Widget useCaseRioIconButtonSoft(BuildContext context) {
  return _buildUseCase(context, variant: RioButtonVariant.soft);
}

@widgetbook.UseCase(
  name: 'Outlined',
  type: RioIconButton,
  path: "inputs",
)
Widget useCaseRioIconButtonIconOutlined(BuildContext context) {
  return _buildUseCase(context, variant: RioButtonVariant.outlined);
}

@widgetbook.UseCase(
  name: 'Plain',
  type: RioIconButton,
  path: "inputs",
)
Widget useCaseRioIconButtonPlain(BuildContext context) {
  return _buildUseCase(context, variant: RioButtonVariant.plain);
}

Widget _buildUseCase(
  BuildContext context, {
  required RioButtonVariant variant,
}) {
  final margin = EdgeInsets.all(
    context.knobs.double
        .slider(label: "Margin", initialValue: 4, max: 16, min: 0),
  );

  final borderRadius = BorderRadius.circular(
    context.knobs.double
        .slider(label: "Border radius", initialValue: 10, min: 0, max: 16),
  );

  final padding = EdgeInsets.symmetric(
    horizontal: context.knobs.double
        .slider(label: "Padding X", initialValue: 8, max: 32, min: 0),
    vertical: context.knobs.double
        .slider(label: "Padding Y", initialValue: 8, max: 16, min: 0),
  );

  final theme = RioIconButtonTheme(
    margin: margin,
    padding: padding,
    borderRadius: borderRadius,
  );

  return Scaffold(
    body: Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RioIconButton(
            icon: const Icon(Icons.search),
            variant: variant,
            theme: theme,
            onPressed: () {},
          ),
          RioIconButton(
            icon: const Icon(Icons.search),
            theme: theme,
            variant: variant,
            disabled: true,
            onPressed: () {},
          ),
          RioIconButton(
            icon: const Icon(Icons.search),
            theme: theme,
            variant: variant,
            loading: true,
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}
