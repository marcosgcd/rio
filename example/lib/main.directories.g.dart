// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;

import 'core/color_scheme.dart' as _i3;
import 'display/divider.dart' as _i2;
import 'inputs/button.dart' as _i4;
import 'inputs/text_field.dart' as _i5;
import 'menus/popover.dart' as _i7;
import 'menus/popover_menu.dart' as _i6;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'Display',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'RioDivider',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i2.useCaseRioDivider,
        ),
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'core',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'RioColorScheme',
        useCase: _i1.WidgetbookUseCase(
          name: 'Color Scheme',
          builder: _i3.colorSchemeUseCase,
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
            builder: _i4.useCaseRioButtonOutlined,
          ),
          _i1.WidgetbookUseCase(
            name: 'Plain',
            builder: _i4.useCaseRioButtonPlain,
          ),
          _i1.WidgetbookUseCase(
            name: 'Soft',
            builder: _i4.useCaseRioButtonSoft,
          ),
          _i1.WidgetbookUseCase(
            name: 'Solid',
            builder: _i4.useCaseRioButtonSolid,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'RioTextField',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i5.useCaseRioTextFieldDefault,
          ),
          _i1.WidgetbookUseCase(
            name: 'Filled',
            builder: _i5.useCaseRioTextFieldFilled,
          ),
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'menus',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'RioMenu',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i6.useCaseRioPopover,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'RioPopover',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i7.useCaseCrPopover,
        ),
      ),
    ],
  ),
];
