import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: RioContainer,
  path: "Display",
)
Widget useCase(BuildContext context) {
  var theme = const RioContainerTheme.defaultTheme();

  theme = theme.copyWith(
    blur: context.knobs.double
        .slider(label: "Blur", initialValue: theme.blur!, min: 0, max: 16),
  );

  return Scaffold(
    body: Stack(
      children: [
        const Center(
          child: SizedBox(
            height: 250,
            width: 250,
            child: Text(_text + _text + _text),
          ),
        ),
        Center(
          child: RioContainer(
            height: 200,
            width: 200,
            theme: theme,
            child: const Center(
              child: Icon(
                Icons.home,
                size: 40,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

const _text =
    "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet. Dolor Sit Amet Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet. Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet.";
