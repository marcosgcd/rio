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
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            RioTextField(
              theme: RioTextFieldTheme(
                filled: filled,
              ),
              decoration: const RioTextFieldDecoration(
                label: Text("Name"),
                hintText: "Max Mustermann",
                helperText: "Vor- und Nachname",
              ),
            ),
            const SizedBox(height: 16),
            RioTextField(
              theme: RioTextFieldTheme(
                filled: filled,
              ),
              keyboardType: TextInputType.emailAddress,
              decoration: const RioTextFieldDecoration(
                label: Text("E-Mail"),
                hintText: "max@example.com",
                helperText: "Wir senden keine Werbung",
              ),
            ),
            const SizedBox(height: 16),
            RioTextField(
              theme: RioTextFieldTheme(
                filled: filled,
              ),
              obscureText: true,
              decoration: const RioTextFieldDecoration(
                label: Text("Passwort"),
                hintText: "Mindestens 8 Zeichen",
              ),
            ),
            const SizedBox(height: 16),
            RioTextField(
              theme: RioTextFieldTheme(
                filled: filled,
              ),
              decoration: const RioTextFieldDecoration(
                label: Text("Telefon"),
                hintText: "+49 170 1234567",
                helperText: "Optional",
                errorText: "Ungültiges Format",
              ),
            ),
            const SizedBox(height: 16),
            RioTextField(
              theme: RioTextFieldTheme(
                filled: filled,
              ),
              maxLines: 4,
              decoration: const RioTextFieldDecoration(
                label: Text("Notiz"),
                hintText: "Zusätzliche Informationen",
                helperText: "Mehrzeiliges Feld",
              ),
            ),
            const SizedBox(height: 16),
            RioTextField(
              theme: RioTextFieldTheme(
                filled: filled,
              ),
              disabled: true,
              decoration: const RioTextFieldDecoration(
                label: Text("Disabled"),
                hintText: "Nicht bearbeitbar",
                helperText: "Nur zur Anzeige",
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
