import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioDateRangePicker,
  path: "inputs",
)
Widget useCaseRioDateRangePickerDefault(BuildContext context) {
  return _buildUseCase(context, filled: false);
}

@widgetbook.UseCase(
  name: 'Filled',
  type: RioDateRangePicker,
  path: "inputs",
)
Widget useCaseRioDateRangePickerFilled(BuildContext context) {
  return _buildUseCase(context, filled: true);
}

Widget _buildUseCase(
  BuildContext context, {
  required bool filled,
}) {
  return _RioDateRangePickerShowcase(
    filled: filled,
  );
}

class _RioDateRangePickerShowcase extends StatefulWidget {
  const _RioDateRangePickerShowcase({
    required this.filled,
  });

  final bool filled;

  @override
  State<_RioDateRangePickerShowcase> createState() =>
      _RioDateRangePickerShowcaseState();
}

class _RioDateRangePickerShowcaseState
    extends State<_RioDateRangePickerShowcase> {
  DateTimeRange? _billingRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 6)),
    end: DateTime.now(),
  );
  DateTimeRange? _vacationRange;
  DateTimeRange? _standaloneRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 3)),
    end: DateTime.now().add(const Duration(days: 2)),
  );

  @override
  Widget build(BuildContext context) {
    final textFieldTheme = RioTextFieldTheme(
      filled: widget.filled,
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RioDateRangePicker(
                value: _billingRange,
                onChanged: (value) {
                  setState(() {
                    _billingRange = value;
                  });
                },
                theme: textFieldTheme,
                decoration: const RioTextFieldDecoration(
                  label: Text('Billing period'),
                  hintText: 'Select a range',
                  helperText: 'Tap to open compact range picker',
                ),
              ),
              const SizedBox(height: 16),
              RioDateRangePicker(
                value: _vacationRange,
                onChanged: (value) {
                  setState(() {
                    _vacationRange = value;
                  });
                },
                theme: textFieldTheme,
                minimumDate: DateTime.now().subtract(const Duration(days: 90)),
                maximumDate: DateTime.now().add(const Duration(days: 365)),
                modalHeight: 420,
                clearText: 'Leeren',
                decoration: const RioTextFieldDecoration(
                  label: Text('Vacation'),
                  hintText: 'Select travel dates',
                  helperText: 'Modal height customized to 420',
                ),
              ),
              const SizedBox(height: 16),
              RioDateRangePicker(
                value: DateTimeRange(
                  start: DateTime.now().subtract(const Duration(days: 2)),
                  end: DateTime.now().add(const Duration(days: 2)),
                ),
                onChanged: null,
                disabled: true,
                theme: textFieldTheme,
                decoration: const RioTextFieldDecoration(
                  label: Text('Disabled'),
                  hintText: 'Not editable',
                  helperText: 'Read-only showcase',
                ),
              ),
              const SizedBox(height: 16),
              Text('Billing period: ${_formatRange(_billingRange)}'),
              Text('Vacation period: ${_formatRange(_vacationRange)}'),
              const SizedBox(height: 16),
              Text(
                'Standalone calendar',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 380,
                child: RioDateRangeCalendar(
                  value: _standaloneRange,
                  onChanged: (value) {
                    setState(() {
                      _standaloneRange = value;
                    });
                  },
                  minimumDate:
                      DateTime.now().subtract(const Duration(days: 120)),
                  maximumDate: DateTime.now().add(const Duration(days: 365)),
                ),
              ),
              const SizedBox(height: 8),
              Text('Standalone period: ${_formatRange(_standaloneRange)}'),
            ],
          ),
        ),
      ),
    );
  }

  String _formatRange(DateTimeRange? value) {
    if (value == null) {
      return '-';
    }

    final start = _formatDate(value.start);
    final end = _formatDate(value.end);
    if (start == end) {
      return start;
    }
    return '$start - $end';
  }

  String _formatDate(DateTime value) {
    final day = value.day.toString().padLeft(2, '0');
    final month = value.month.toString().padLeft(2, '0');
    final year = value.year.toString().padLeft(4, '0');
    return '$day.$month.$year';
  }
}
