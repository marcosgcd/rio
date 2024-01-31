import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Solid',
  type: RioButton,
  path: "inputs",
)
Widget useCaseRioButtonSolid(BuildContext context) {
  return _buildUseCase(context, variant: RioButtonVariant.solid);
}

@widgetbook.UseCase(
  name: 'Soft',
  type: RioButton,
  path: "inputs",
)
Widget useCaseRioButtonSoft(BuildContext context) {
  return _buildUseCase(context, variant: RioButtonVariant.soft);
}

@widgetbook.UseCase(
  name: 'Outlined',
  type: RioButton,
  path: "inputs",
)
Widget useCaseRioButtonOutlined(BuildContext context) {
  return _buildUseCase(context, variant: RioButtonVariant.outlined);
}

@widgetbook.UseCase(
  name: 'Plain',
  type: RioButton,
  path: "inputs",
)
Widget useCaseRioButtonPlain(BuildContext context) {
  return _buildUseCase(context, variant: RioButtonVariant.plain);
}

Widget _buildUseCase(
  BuildContext context, {
  required RioButtonVariant variant,
}) {
  final text = Text(
    context.knobs.string(label: "Label", initialValue: "Hello World"),
  );

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
        .slider(label: "Padding X", initialValue: 16, max: 32, min: 0),
    vertical: context.knobs.double
        .slider(label: "Padding Y", initialValue: 8, max: 16, min: 0),
  );

  final theme = RioButtonTheme(
    margin: margin,
    padding: padding,
    borderRadius: borderRadius,
  );

  return Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RioButton(
            leading: const Icon(Icons.search),
            variant: variant,
            theme: theme,
            child: text,
            onPressed: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RioButton(
                variant: variant,
                theme: theme,
                child: text,
                onPressed: () {},
              ),
              RioButton(
                variant: variant,
                trailing: const Icon(Icons.send),
                theme: theme,
                onPressed: () {},
                child: text,
              ),
              RioButton(
                variant: variant,
                theme: theme,
                onPressed: () {},
                loading: true,
                child: text,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RioButton(
                variant: variant,
                theme: theme,
                onPressed: () {},
                disabled: true,
                child: text,
              ),
              RioButton(
                leading: const Icon(Icons.search),
                variant: variant,
                theme: theme,
                onPressed: () {},
                disabled: true,
                child: text,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
