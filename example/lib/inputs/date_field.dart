import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioDateField,
  path: "inputs",
)
Widget useCaseRioDateFieldDefault(BuildContext context) {
  return _buildUseCase(context, filled: false);
}

@widgetbook.UseCase(
  name: 'Filled',
  type: RioDateField,
  path: "inputs",
)
Widget useCaseRioDateFieldFilled(BuildContext context) {
  return _buildUseCase(context, filled: true);
}

Widget _buildUseCase(
  BuildContext context, {
  required bool filled,
}) {
  return _RioDateFieldShowcase(
    filled: filled,
  );
}

class _RioDateFieldShowcase extends StatefulWidget {
  const _RioDateFieldShowcase({
    required this.filled,
  });

  final bool filled;

  @override
  State<_RioDateFieldShowcase> createState() => _RioDateFieldShowcaseState();
}

class _RioDateFieldShowcaseState extends State<_RioDateFieldShowcase> {
  DateTime? _birthday = DateTime(1990, 5, 12);
  DateTime? _appointment;

  @override
  Widget build(BuildContext context) {
    final dateOrder = Directionality.of(context) == TextDirection.rtl
        ? DatePickerDateOrder.ymd
        : DatePickerDateOrder.dmy;
    final theme = RioTextFieldTheme(
      filled: widget.filled,
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RioDateField(
                value: _birthday,
                onChanged: (value) {
                  setState(() {
                    _birthday = value;
                  });
                },
                theme: theme,
                dateOrder: dateOrder,
                decoration: const RioTextFieldDecoration(
                  label: Text('Birthday'),
                  hintText: 'Select date',
                  helperText: 'Tap to open date picker',
                ),
              ),
              const SizedBox(height: 16),
              RioDateField(
                value: _appointment,
                onChanged: (value) {
                  setState(() {
                    _appointment = value;
                  });
                },
                theme: theme,
                dateOrder: dateOrder,
                minimumDate: DateTime.now().subtract(const Duration(days: 30)),
                maximumDate: DateTime.now().add(const Duration(days: 365)),
                clearText: 'Leeren',
                decoration: const RioTextFieldDecoration(
                  label: Text('Appointment'),
                  hintText: 'Select date',
                  helperText: 'Clear via x icon or clear button in modal',
                ),
              ),
              const SizedBox(height: 16),
              RioDateField(
                value: DateTime.now(),
                onChanged: null,
                disabled: true,
                theme: theme,
                decoration: const RioTextFieldDecoration(
                  label: Text('Disabled'),
                  hintText: 'Not editable',
                  helperText: 'Read-only showcase',
                ),
              ),
              const SizedBox(height: 16),
              Text('Birthday: ${_birthday ?? '-'}'),
              Text('Appointment: ${_appointment ?? '-'}'),
            ],
          ),
        ),
      ),
    );
  }
}
