import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Rio Inputs',
  type: FormBuilder,
  path: "inputs",
)
Widget useCaseRioFormBuilder(BuildContext context) {
  return const _RioFormBuilderShowcase();
}

class _RioFormBuilderShowcase extends StatefulWidget {
  const _RioFormBuilderShowcase();

  @override
  State<_RioFormBuilderShowcase> createState() =>
      _RioFormBuilderShowcaseState();
}

class _RioFormBuilderShowcaseState extends State<_RioFormBuilderShowcase> {
  final _formKey = GlobalKey<FormBuilderState>();

  Map<String, dynamic> _savedValues = {};

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
  ];

  static const _tagItems = [
    RioToggleButtonsButton(
      value: 'news',
      label: Text('News'),
    ),
    RioToggleButtonsButton(
      value: 'alerts',
      label: Text('Alerts'),
    ),
    RioToggleButtonsButton(
      value: 'offers',
      label: Text('Offers'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RioFormBuilderTextField(
                  name: 'name',
                  initialValue: 'Marcos',
                  decoration: const RioTextFieldDecoration(
                    label: Text('Name'),
                    hintText: 'Type your name',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                RioFormBuilderDropdownField<String>(
                  name: 'country',
                  initialValue: 'de',
                  items: _countryItems,
                  behavior: RioDropdownFieldBehavior.auto,
                  decoration: const RioTextFieldDecoration(
                    label: Text('Country'),
                    hintText: 'Select country',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Country is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                RioFormBuilderDateField(
                  name: 'birthday',
                  initialValue: DateTime(1990, 1, 1),
                  decoration: const RioTextFieldDecoration(
                    label: Text('Birthday'),
                    hintText: 'Select date',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Birthday is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                RioFormBuilderCheckbox(
                  name: 'terms',
                  initialValue: false,
                  label: const Text('Accept terms and conditions'),
                  validator: (value) {
                    if (value != true) {
                      return 'Please accept terms';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                RioFormBuilderToggleButtons<String>(
                  name: 'subscriptions',
                  items: _tagItems,
                  initialValue: const ['news'],
                  variant: RioToggleButtonsVariant.soft,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pick at least one subscription';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                RioFormBuilderPinField(
                  name: 'pin',
                  count: 4,
                  initialValue: '',
                  validator: (value) {
                    if (value == null || value.length != 4) {
                      return 'PIN must have 4 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: RioButton(
                        theme: const RioButtonTheme(
                          variant: RioButtonVariant.outlined,
                        ),
                        onPressed: () {
                          _formKey.currentState?.reset();
                          setState(() {
                            _savedValues = {};
                          });
                        },
                        child: const Text('Reset'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: RioButton(
                        theme: const RioButtonTheme(
                          variant: RioButtonVariant.soft,
                        ),
                        onPressed: () {
                          final isValid =
                              _formKey.currentState?.saveAndValidate() ?? false;
                          if (!isValid) {
                            return;
                          }
                          setState(() {
                            _savedValues = Map<String, dynamic>.from(
                              _formKey.currentState!.value,
                            );
                          });
                        },
                        child: const Text('Save & Validate'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Saved values: $_savedValues',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
