import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rio/rio.dart';

void main() {
  Widget wrapWithTheme(Widget child) {
    final theme = RioTheme(
      colorScheme: RioColorScheme.fromSeed(Colors.teal),
    ).toThemeData();

    return MaterialApp(
      theme: theme,
      home: Scaffold(body: Center(child: child)),
    );
  }

  testWidgets('RioDialogTitle renders and centers content', (tester) async {
    await tester.pumpWidget(
      wrapWithTheme(
        const RioDialogTitle(title: Text('Dialog title')),
      ),
    );

    expect(find.text('Dialog title'), findsOneWidget);
  });

  testWidgets('RioDialogActionRow triggers cancel and confirm', (tester) async {
    var cancelTapped = false;
    var confirmTapped = false;

    await tester.pumpWidget(
      wrapWithTheme(
        RioDialogActionRow(
          cancelText: 'Cancel',
          confirmText: 'Confirm',
          onCancel: () {
            cancelTapped = true;
          },
          onConfirm: () {
            confirmTapped = true;
          },
        ),
      ),
    );

    await tester.tap(find.text('Cancel'));
    await tester.tap(find.text('Confirm'));
    await tester.pump(const Duration(milliseconds: 400));

    expect(cancelTapped, isTrue);
    expect(confirmTapped, isTrue);
  });

  testWidgets('RioDialogFormMultiChoiceField toggles values', (tester) async {
    final formKey = GlobalKey<FormBuilderState>();

    await tester.pumpWidget(
      wrapWithTheme(
        FormBuilder(
          key: formKey,
          child: RioDialogFormMultiChoiceField<String>(
            name: 'workdays',
            label: 'Workdays',
            items: const [
              RioDialogChoiceItem(value: 'mon', label: 'Mon'),
              RioDialogChoiceItem(value: 'tue', label: 'Tue'),
            ],
          ),
        ),
      ),
    );

    await tester.tap(find.text('Mon'));
    await tester.pumpAndSettle();

    final selectedAfterAdd =
        formKey.currentState?.fields['workdays']?.value as List<String>?;
    expect(selectedAfterAdd, isNotNull);
    expect(selectedAfterAdd, contains('mon'));

    await tester.tap(find.text('Mon'));
    await tester.pumpAndSettle();

    final selectedAfterRemove =
        formKey.currentState?.fields['workdays']?.value as List<String>?;
    expect(selectedAfterRemove, isNotNull);
    expect(selectedAfterRemove, isNot(contains('mon')));
  });
}
