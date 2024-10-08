// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;

import 'core/color_scheme.dart' as _i6;
import 'display/avatar.dart' as _i2;
import 'display/container.dart' as _i3;
import 'display/divider.dart' as _i4;
import 'display/list_view.dart' as _i5;
import 'inputs/button.dart' as _i7;
import 'inputs/checkbox.dart' as _i8;
import 'inputs/icon_button.dart' as _i9;
import 'inputs/pin_field.dart' as _i10;
import 'inputs/text_field.dart' as _i11;
import 'inputs/toggle_buttons.dart' as _i12;
import 'menus/navigation_bar.dart' as _i14;
import 'menus/popover.dart' as _i15;
import 'menus/popover_menu.dart' as _i13;
import 'menus/toolbar.dart' as _i16;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'Display',
    children: [
      _i1.WidgetbookComponent(
        name: 'RioAvatar',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Outlined',
            builder: _i2.useCaseRioAvatarOutlined,
          ),
          _i1.WidgetbookUseCase(
            name: 'Plain',
            builder: _i2.useCaseRioAvatarPlain,
          ),
          _i1.WidgetbookUseCase(
            name: 'Soft',
            builder: _i2.useCaseRioAvatarSoft,
          ),
          _i1.WidgetbookUseCase(
            name: 'Solid',
            builder: _i2.useCaseRioAvatarSolid,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'RioContainer',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i3.useCase,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioDivider',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Horizontal',
            builder: _i4.useCaseRioHorizontal,
          ),
          _i1.WidgetbookUseCase(
            name: 'Vertical',
            builder: _i4.useCaseRioVertical,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'RioListView<dynamic, dynamic>',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'default',
            builder: _i5.useCaseRioListView,
          ),
          _i1.WidgetbookUseCase(
            name: 'grouped',
            builder: _i5.useCaseRioListViewGrouped,
          ),
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'core',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'RioColorScheme',
        useCase: _i1.WidgetbookUseCase(
          name: 'Color Scheme',
          builder: _i6.colorSchemeUseCase,
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
            builder: _i7.useCaseRioButtonOutlined,
          ),
          _i1.WidgetbookUseCase(
            name: 'Plain',
            builder: _i7.useCaseRioButtonPlain,
          ),
          _i1.WidgetbookUseCase(
            name: 'Soft',
            builder: _i7.useCaseRioButtonSoft,
          ),
          _i1.WidgetbookUseCase(
            name: 'Solid',
            builder: _i7.useCaseRioButtonSolid,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'RioCheckbox',
        useCase: _i1.WidgetbookUseCase(
          name: 'Checkbox',
          builder: _i8.useCaseRioCeckbox,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioIconButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Outlined',
            builder: _i9.useCaseRioIconButtonIconOutlined,
          ),
          _i1.WidgetbookUseCase(
            name: 'Plain',
            builder: _i9.useCaseRioIconButtonPlain,
          ),
          _i1.WidgetbookUseCase(
            name: 'Soft',
            builder: _i9.useCaseRioIconButtonSoft,
          ),
          _i1.WidgetbookUseCase(
            name: 'Solid',
            builder: _i9.useCaseRioIconButtonSolid,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'RioPinField',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i10.useCaseRioPinField,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioTextField',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i11.useCaseRioTextFieldDefault,
          ),
          _i1.WidgetbookUseCase(
            name: 'Filled',
            builder: _i11.useCaseRioTextFieldFilled,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'RioToggleButtons',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Soft',
            builder: _i12.useCaseRioToggleButtonSoft,
          ),
          _i1.WidgetbookUseCase(
            name: 'Solid',
            builder: _i12.useCaseRioToggleButtonSolid,
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
          builder: _i13.useCaseRioPopover,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioNavigationBar',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Horizontal',
            builder: _i14.useCaseHorizontal,
          ),
          _i1.WidgetbookUseCase(
            name: 'Vertical',
            builder: _i14.useCaseVertical,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'RioPopover',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i15.useCaseRioPopover,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioToolbar',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Custom',
            builder: _i16.useCaseRioToolbarCustom,
          ),
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i16.useCaseRioToolbarDefault,
          ),
        ],
      ),
    ],
  ),
];
