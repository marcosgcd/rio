// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;

import 'core/color_scheme.dart' as _i2;
import 'inputs/button.dart' as _i3;
import 'inputs/text_field.dart' as _i4;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'core',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'RioColorScheme',
        useCase: _i1.WidgetbookUseCase(
          name: 'Color Scheme',
          builder: _i2.colorSchemeUseCase,
        ),
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'inputs',
    children: [
      _i1.WidgetbookComponent(
        name: 'RioButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Outlined',
            builder: _i3.useCaseRioButtonOutlined,
          ),
          _i1.WidgetbookUseCase(
            name: 'Plain',
            builder: _i3.useCaseRioButtonPlain,
          ),
          _i1.WidgetbookUseCase(
            name: 'Soft',
            builder: _i3.useCaseRioButtonSoft,
          ),
          _i1.WidgetbookUseCase(
            name: 'Solid',
            builder: _i3.useCaseRioButtonSolid,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'RioTextField',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i4.useCaseRioTextFieldDefault,
          ),
          _i1.WidgetbookUseCase(
            name: 'Filled',
            builder: _i4.useCaseRioTextFieldFilled,
          ),
        ],
      ),
    ],
  ),
];
