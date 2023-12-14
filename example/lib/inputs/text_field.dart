import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioTextField,
  path: "inputs",
)
Widget useCaseRioTextFieldDefault(BuildContext context) {
  return _buildUseCase(context, filled: false);
}

@widgetbook.UseCase(
  name: 'Filled',
  type: RioTextField,
  path: "inputs",
)
Widget useCaseRioTextFieldFilled(BuildContext context) {
  return _buildUseCase(context, filled: true);
}

Widget _buildUseCase(
  BuildContext context, {
  required bool filled,
}) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RioTextField(
            theme: RioTextFieldTheme(
              filled: filled,
            ),
            decoration: const RioTextFieldDecoration(
              label: Text("Text"),
              hintText: "Hint",
              helperText: "Helper",
            ),
          ),
          const SizedBox(height: 16),
          RioTextField(
            theme: RioTextFieldTheme(
              filled: filled,
            ),
            decoration: const RioTextFieldDecoration(
              label: Text("Text"),
              hintText: "Hint",
              helperText: "Helper",
              errorText: "Error",
            ),
          ),
        ],
      ),
    ),
  );
}
