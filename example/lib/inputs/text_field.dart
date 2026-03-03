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
  return _RioTextFieldShowcase(
    filled: filled,
  );
}

class _RioTextFieldShowcase extends StatefulWidget {
  const _RioTextFieldShowcase({
    required this.filled,
  });

  final bool filled;

  @override
  State<_RioTextFieldShowcase> createState() => _RioTextFieldShowcaseState();
}

class _RioTextFieldShowcaseState extends State<_RioTextFieldShowcase> {
  String _errorOnInputValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              RioTextField(
                theme: RioTextFieldTheme(
                  filled: widget.filled,
                ),
                decoration: const RioTextFieldDecoration(
                  label: Text("Name"),
                  hintText: "Max Mustermann",
                ),
              ),
              const SizedBox(height: 16),
              RioTextField(
                theme: RioTextFieldTheme(
                  filled: widget.filled,
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
                  filled: widget.filled,
                ),
                onChanged: (value) {
                  if (_errorOnInputValue == value) {
                    return;
                  }
                  setState(() {
                    _errorOnInputValue = value;
                  });
                },
                decoration: RioTextFieldDecoration(
                  label: const Text("Error Behavior"),
                  hintText: "Type anything to trigger an error",
                  errorText: _errorOnInputValue.isNotEmpty
                      ? "Demo error: any input is invalid"
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              RioTextField(
                theme: RioTextFieldTheme(
                  filled: widget.filled,
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
                  filled: widget.filled,
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
                  filled: widget.filled,
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
                  filled: widget.filled,
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
}
