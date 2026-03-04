import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioDropdownField<String>,
  path: "inputs",
)
Widget useCaseRioDropdownFieldDefault(BuildContext context) {
  return _buildUseCase(context, filled: false);
}

@widgetbook.UseCase(
  name: 'Filled',
  type: RioDropdownField<String>,
  path: "inputs",
)
Widget useCaseRioDropdownFieldFilled(BuildContext context) {
  return _buildUseCase(context, filled: true);
}

@widgetbook.UseCase(
  name: 'Lots of options',
  type: RioDropdownField<String>,
  path: "inputs",
)
Widget useCaseRioDropdownFieldManyOptions(BuildContext context) {
  return const _RioDropdownFieldManyOptionsShowcase();
}

@widgetbook.UseCase(
  name: 'Behavior Auto',
  type: RioDropdownField<String>,
  path: "inputs",
)
Widget useCaseRioDropdownFieldBehaviorAuto(BuildContext context) {
  return const _RioDropdownFieldBehaviorShowcase(
    behavior: RioDropdownFieldBehavior.auto,
  );
}

@widgetbook.UseCase(
  name: 'Behavior Dropdown',
  type: RioDropdownField<String>,
  path: "inputs",
)
Widget useCaseRioDropdownFieldBehaviorDropdown(BuildContext context) {
  return const _RioDropdownFieldBehaviorShowcase(
    behavior: RioDropdownFieldBehavior.dropdown,
  );
}

@widgetbook.UseCase(
  name: 'Behavior Modal',
  type: RioDropdownField<String>,
  path: "inputs",
)
Widget useCaseRioDropdownFieldBehaviorModal(BuildContext context) {
  return const _RioDropdownFieldBehaviorShowcase(
    behavior: RioDropdownFieldBehavior.modal,
  );
}

Widget _buildUseCase(
  BuildContext context, {
  required bool filled,
}) {
  return _RioDropdownFieldShowcase(
    filled: filled,
  );
}

class _RioDropdownFieldShowcase extends StatefulWidget {
  const _RioDropdownFieldShowcase({
    required this.filled,
  });

  final bool filled;

  @override
  State<_RioDropdownFieldShowcase> createState() =>
      _RioDropdownFieldShowcaseState();
}

class _RioDropdownFieldShowcaseState extends State<_RioDropdownFieldShowcase> {
  String? _country = 'de';
  String? _priority;

  static const _countryItems = [
    RioDropdownFieldItem(
      value: 'de',
      label: 'Germany',
      title: Text('Germany'),
    ),
    RioDropdownFieldItem(
      value: 'fr',
      label: 'France',
      title: Text('France'),
    ),
    RioDropdownFieldItem(
      value: 'es',
      label: 'Spain',
      title: Text('Spain'),
    ),
    RioDropdownFieldItem(
      value: 'it',
      label: 'Italy',
      title: Text('Italy'),
    ),
  ];

  static const _priorityItems = [
    RioDropdownFieldItem(
      value: 'low',
      label: 'Low',
      title: Text('Low'),
      trailing: Icon(Icons.flag_outlined),
    ),
    RioDropdownFieldItem(
      value: 'medium',
      label: 'Medium',
      title: Text('Medium'),
      trailing: Icon(Icons.flag_outlined),
    ),
    RioDropdownFieldItem(
      value: 'high',
      label: 'High',
      title: Text('High'),
      trailing: Icon(Icons.flag),
    ),
  ];

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
              RioDropdownField<String>(
                items: _countryItems,
                value: _country,
                onChanged: (value) {
                  setState(() {
                    _country = value;
                  });
                },
                theme: textFieldTheme,
                decoration: const RioTextFieldDecoration(
                  label: Text('Country'),
                  hintText: 'Choose a country',
                  helperText: 'Tap to open menu',
                ),
              ),
              const SizedBox(height: 16),
              RioDropdownField<String>(
                items: _priorityItems,
                value: _priority,
                onChanged: (value) {
                  setState(() {
                    _priority = value;
                  });
                },
                theme: textFieldTheme,
                decoration: RioTextFieldDecoration(
                  label: const Text('Priority (required)'),
                  hintText: 'Choose a priority',
                  errorText:
                      _priority == null ? 'Please select a priority.' : null,
                ),
              ),
              const SizedBox(height: 16),
              RioDropdownField<String>(
                items: _countryItems,
                value: null,
                onChanged: null,
                theme: textFieldTheme,
                decoration: const RioTextFieldDecoration(
                  label: Text('Disabled'),
                  hintText: 'Selection not available',
                  helperText: 'This field is disabled',
                ),
              ),
              const SizedBox(height: 16),
              Text('Selected country: ${_country ?? '-'}'),
              Text('Selected priority: ${_priority ?? '-'}'),
            ],
          ),
        ),
      ),
    );
  }
}

class _RioDropdownFieldManyOptionsShowcase extends StatefulWidget {
  const _RioDropdownFieldManyOptionsShowcase();

  @override
  State<_RioDropdownFieldManyOptionsShowcase> createState() =>
      _RioDropdownFieldManyOptionsShowcaseState();
}

class _RioDropdownFieldManyOptionsShowcaseState
    extends State<_RioDropdownFieldManyOptionsShowcase> {
  String? _selectedOption = 'option_20';

  late final List<RioDropdownFieldItem<String>> _manyOptions = List.generate(
    60,
    (index) {
      final optionNumber = index + 1;
      return RioDropdownFieldItem(
        value: 'option_$optionNumber',
        label: 'Option $optionNumber',
        title: Text('Option $optionNumber'),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              RioDropdownField<String>(
                items: _manyOptions,
                value: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
                theme: const RioTextFieldTheme(
                  filled: true,
                ),
                decoration: const RioTextFieldDecoration(
                  label: Text('Many options'),
                  hintText: 'Pick one',
                  helperText: 'This dropdown contains 60 options',
                ),
              ),
              const SizedBox(height: 16),
              Text('Selected: ${_selectedOption ?? '-'}'),
            ],
          ),
        ),
      ),
    );
  }
}

class _RioDropdownFieldBehaviorShowcase extends StatefulWidget {
  const _RioDropdownFieldBehaviorShowcase({
    required this.behavior,
  });

  final RioDropdownFieldBehavior behavior;

  @override
  State<_RioDropdownFieldBehaviorShowcase> createState() =>
      _RioDropdownFieldBehaviorShowcaseState();
}

class _RioDropdownFieldBehaviorShowcaseState
    extends State<_RioDropdownFieldBehaviorShowcase> {
  String? _priority = 'low';

  static const _priorityItems = [
    RioDropdownFieldItem(
      value: 'low',
      label: 'Low',
      title: Text('Low'),
      icon: Icon(Icons.flag_outlined),
      trailing: Icon(Icons.flag_outlined),
    ),
    RioDropdownFieldItem(
      value: 'medium',
      label: 'Medium',
      title: Text('Medium'),
      icon: Icon(Icons.flag_outlined),
      trailing: Icon(Icons.flag_outlined),
    ),
    RioDropdownFieldItem(
      value: 'high',
      label: 'High',
      title: Text('High'),
      icon: Icon(Icons.flag),
      trailing: Icon(Icons.flag),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              RioDropdownField<String>(
                behavior: widget.behavior,
                items: _priorityItems,
                value: _priority,
                onChanged: (value) {
                  setState(() {
                    _priority = value;
                  });
                },
                theme: const RioTextFieldTheme(
                  filled: true,
                ),
                decoration: RioTextFieldDecoration(
                  label: Text('Behavior: ${widget.behavior.name}'),
                  hintText: 'Choose priority',
                  helperText: 'Use this use-case to validate selection mode.',
                ),
              ),
              const SizedBox(height: 16),
              Text('Selected priority: ${_priority ?? '-'}'),
            ],
          ),
        ),
      ),
    );
  }
}
