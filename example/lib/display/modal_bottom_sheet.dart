import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioModal,
  path: "Display",
)
Widget defaultModal(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RioButton(
            onPressed: () {
              showRioModal(
                context,
                builder: (context) => _ModalContent(),
              );
            },
            child: const Text('Show Default Modal'),
          ),
          const SizedBox(height: 16),
          RioButton(
            onPressed: () {
              showRioModal(
                context,
                theme: const RioModalTheme(
                  showCloseButton: false,
                  padding: EdgeInsets.all(24),
                ),
                builder: (context) => _ModalContentWithCustomButton(),
              );
            },
            child: const Text('Show Modal Without Close Button'),
          ),
          const SizedBox(height: 16),
          RioButton(
            onPressed: () {
              showRioModal(
                context,
                theme: const RioModalTheme(
                  maxHeight: 300,
                  padding: EdgeInsets.all(32),
                  dismissDirection: DismissDirection.horizontal,
                ),
                builder: (context) => _CustomModalContent(),
              );
            },
            child: const Text('Show Custom Modal'),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Form',
  type: RioModal,
  path: "Display",
)
Widget modalWithForm(BuildContext context) {
  return Scaffold(
    body: Center(
      child: RioButton(
        onPressed: () {
          showRioModal(
            context,
            theme: const RioModalTheme(
              resizeToAvoidBottomInset: true,
            ),
            builder: (context) => _FormModalContent(),
          );
        },
        child: const Text('Show Modal with Form'),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Calendar Example',
  type: RioModal,
  path: "Display",
)
Widget calendarModal(BuildContext context) {
  return Scaffold(
    body: Center(
      child: RioButton(
        onPressed: () async {
          final selectedDate = await showRioModal<DateTime>(
            context,
            theme: const RioModalTheme(
              padding: EdgeInsets.all(16),
              maxHeight: 500,
            ),
            builder: (context) => _CalendarModalContent(),
          );

          if (selectedDate != null && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Selected date: ${selectedDate.toLocal()}'),
              ),
            );
          }
        },
        child: const Text('Show Calendar Modal'),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'List',
  type: RioModal,
  path: "Display",
)
Widget listModal(BuildContext context) {
  return Scaffold(
    body: Center(
      child: RioButton(
        onPressed: () {
          showRioModal(
            context,
            theme: const RioModalTheme(
              padding: EdgeInsets.fromLTRB(
                16,
                24,
                16,
                0,
              ),
              maxHeight: 600,
              useSafeArea: false,
            ),
            builder: (context) => _ListModalContent(),
          );
        },
        child: const Text('Show List Modal'),
      ),
    ),
  );
}

class _ModalContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.info,
            size: 48,
            color: Colors.blue,
          ),
          const SizedBox(height: 16),
          const Text(
            'Modal Example',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'This is a basic modal example using RioModal. You can dismiss it by:\n\n'
            '• Tapping the close button\n'
            '• Swiping down\n'
            '• Tapping outside (barrier)',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: RioButton(
                  theme:
                      const RioButtonTheme(variant: RioButtonVariant.outlined),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: RioButton(
                  onPressed: () => Navigator.of(context).pop('confirmed'),
                  child: const Text('Confirm'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ModalContentWithCustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Custom Modal',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            RioIconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'This modal has the default close button disabled and uses a custom close button in the header.',
        ),
        const SizedBox(height: 24),
        RioButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Done'),
        ),
      ],
    );
  }
}

class _CustomModalContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.settings,
          size: 32,
        ),
        const SizedBox(height: 16),
        const Text(
          'Custom Settings',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'This modal has:\n'
          '• Custom max height (300px)\n'
          '• Custom padding (32px)\n'
          '• Horizontal dismiss direction',
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        RioButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class _FormModalContent extends StatefulWidget {
  @override
  State<_FormModalContent> createState() => _FormModalContentState();
}

class _FormModalContentState extends State<_FormModalContent> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Contact Form',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        RioTextField(
          controller: _nameController,
          decoration: const RioTextFieldDecoration(
            label: Text('Name'),
            hintText: 'Enter your name',
          ),
        ),
        const SizedBox(height: 16),
        RioTextField(
          controller: _emailController,
          decoration: const RioTextFieldDecoration(
            label: Text('Email'),
            hintText: 'Enter your email',
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: RioButton(
                theme: const RioButtonTheme(variant: RioButtonVariant.outlined),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: RioButton(
                onPressed: () {
                  // Simulate form submission
                  Navigator.of(context).pop({
                    'name': _nameController.text,
                    'email': _emailController.text,
                  });
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CalendarModalContent extends StatefulWidget {
  @override
  State<_CalendarModalContent> createState() => _CalendarModalContentState();
}

class _CalendarModalContentState extends State<_CalendarModalContent> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Select Date',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: CalendarDatePicker(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateChanged: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: RioButton(
                theme: const RioButtonTheme(variant: RioButtonVariant.outlined),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: RioButton(
                onPressed: () => Navigator.of(context).pop(selectedDate),
                child: const Text('Select'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ListModalContent extends StatefulWidget {
  @override
  State<_ListModalContent> createState() => _ListModalContentState();
}

class _ListModalContentState extends State<_ListModalContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Browse Items',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  title: Text("Item ${index + 1}"),
                  subtitle: Text('Added ${DateTime.now().difference(
                        DateTime.now().subtract(Duration(minutes: index * 5)),
                      ).inMinutes} minutes ago'),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
