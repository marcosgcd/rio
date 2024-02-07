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
import 'inputs/checkbox.dart' as _i5;
import 'inputs/icon_button.dart' as _i6;
import 'inputs/pin_field.dart' as _i7;
import 'inputs/text_field.dart' as _i8;
import 'inputs/toggle_buttons.dart' as _i9;
import 'menus/popover.dart' as _i11;
import 'menus/popover_menu.dart' as _i10;
import 'menus/toolbar.dart' as _i12;

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
      _i1.WidgetbookLeafComponent(
        name: 'RioCheckbox',
        useCase: _i1.WidgetbookUseCase(
          name: 'Checkbox',
          builder: _i5.useCaseRioCeckbox,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioIconButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Outlined',
            builder: _i6.useCaseRioIconButtonIconOutlined,
          ),
          _i1.WidgetbookUseCase(
            name: 'Plain',
            builder: _i6.useCaseRioIconButtonPlain,
          ),
          _i1.WidgetbookUseCase(
            name: 'Soft',
            builder: _i6.useCaseRioIconButtonSoft,
          ),
          _i1.WidgetbookUseCase(
            name: 'Solid',
            builder: _i6.useCaseRioIconButtonSolid,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'RioPinField',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i7.useCaseRioPinField,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioTextField',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i8.useCaseRioTextFieldDefault,
          ),
          _i1.WidgetbookUseCase(
            name: 'Filled',
            builder: _i8.useCaseRioTextFieldFilled,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'RioToggleButtons',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Soft',
            builder: _i9.useCaseRioToggleButtonSoft,
          ),
          _i1.WidgetbookUseCase(
            name: 'Solid',
            builder: _i9.useCaseRioToggleButtonSolid,
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
          builder: _i10.useCaseRioPopover,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'RioPopover',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i11.useCaseRioPopover,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioToolbar',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Custom',
            builder: _i12.useCaseRioToolbarCustom,
          ),
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i12.useCaseRioToolbarDefault,
          ),
        ],
      ),
    ],
  ),
];
