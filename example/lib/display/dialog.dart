import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioDialog,
  path: "Display",
)
Widget defaultDialog(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'dialog-example',
            child: RioButton(
              onPressed: () {
                showRioDialog(
                  context,
                  builder: (context) => _DialogContent(),
                );
              },
              child: const Text('Show Dialog'),
            ),
          ),
          const SizedBox(height: 16),
          Hero(
            tag: 'dialog-custom',
            child: RioButton(
              onPressed: () {
                showRioDialog(
                  context,
                  theme: RioDialogTheme(
                    showCloseButton: false,
                    maxWidth: 500,
                    padding: const EdgeInsets.all(32),
                    containerTheme: RioContainerTheme(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(
                          RioTheme.of(context).defaultBorderRadius),
                      // You can also add borders, shadows, etc.
                      // border: Border.all(color: Colors.red, width: 2),
                      // boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                    ),
                  ),
                  builder: (context) => _CustomDialogContent(),
                );
              },
              child: const Text('Show Custom Container Theme'),
            ),
          ),
          const SizedBox(height: 16),
          Hero(
            tag: 'hero-dialog-simple',
            child: RioButton(
              onPressed: () {
                showRioDialog(
                  context,
                  heroTag: 'hero-dialog-simple', // Same tag as Hero widget
                  builder: (context) => _SimpleHeroDialogContent(),
                );
              },
              child: const Text('Show Hero Dialog (Built-in Close)'),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Dialogs provide smooth animations when opened from Hero widgets.\n'
            'Use showRioDialog with heroTag for Hero animations, or without for simple dialogs.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}

class _DialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          size: 48,
          color: Colors.amber,
        ),
        const SizedBox(height: 16),
        const Text(
          'Dialog Example',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'This dialog opened with a smooth animation! '
          'It provides the same convenient API as showRioModal but uses '
          'a different route for center-positioned dialogs.',
          textAlign: TextAlign.center,
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
                onPressed: () => Navigator.of(context).pop('confirmed'),
                child: const Text('Confirm'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CustomDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Custom Dialog',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            RioIconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'This dialog demonstrates container theming:\n'
          '• Orange background via containerTheme.color\n'
          '• Rounded corners via containerTheme.borderRadius\n'
          '• Custom padding via theme.padding\n'
          '• No built-in close button (custom one provided)\n\n'
          'The dialog content is automatically wrapped in a RioContainer\n'
          'that you can style via RioDialogTheme.containerTheme',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        RioButton(
          theme: const RioButtonTheme(
            variant: RioButtonVariant.soft,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Done', style: TextStyle(color: Colors.orange)),
        ),
      ],
    );
  }
}

class _SimpleHeroDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.rocket_launch,
            size: 48,
            color: Colors.purple,
          ),
          const SizedBox(height: 16),
          Text(
            'Hero Dialog',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'This dialog uses showRioDialog with heroTag parameter. '
            'Hero animations work when the source and destination have matching Hero tags!',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          RioButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
