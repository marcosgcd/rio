// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;

import 'core/color_scheme.dart' as _i9;
import 'display/avatar.dart' as _i2;
import 'display/container.dart' as _i3;
import 'display/dialog.dart' as _i4;
import 'display/divider.dart' as _i5;
import 'display/icon_merger.dart' as _i6;
import 'display/list_view.dart' as _i7;
import 'display/modal_bottom_sheet.dart' as _i8;
import 'inputs/button.dart' as _i10;
import 'inputs/checkbox.dart' as _i11;
import 'inputs/icon_button.dart' as _i12;
import 'inputs/pin_field.dart' as _i13;
import 'inputs/text_field.dart' as _i14;
import 'inputs/toggle_buttons.dart' as _i15;
import 'menus/bottom_navigation.dart' as _i16;
import 'menus/navigation_bar.dart' as _i18;
import 'menus/popover.dart' as _i19;
import 'menus/popover_menu.dart' as _i17;
import 'menus/toolbar.dart' as _i20;

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
      _i1.WidgetbookLeafComponent(
        name: 'RioDialog',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i4.defaultDialog,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioDivider',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Horizontal',
            builder: _i5.useCaseRioHorizontal,
          ),
          _i1.WidgetbookUseCase(
            name: 'Vertical',
            builder: _i5.useCaseRioVertical,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'RioIconMerger',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i6.useCaseRioIconMerger,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioListView<dynamic, dynamic>',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'default',
            builder: _i7.useCaseRioListView,
          ),
          _i1.WidgetbookUseCase(
            name: 'grouped',
            builder: _i7.useCaseRioListViewGrouped,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'RioModal',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Calendar Example',
            builder: _i8.calendarModal,
          ),
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i8.defaultModal,
          ),
          _i1.WidgetbookUseCase(
            name: 'List',
            builder: _i8.listModal,
          ),
          _i1.WidgetbookUseCase(
            name: 'With Form',
            builder: _i8.modalWithForm,
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
          builder: _i9.colorSchemeUseCase,
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
            builder: _i10.useCaseRioButtonOutlined,
          ),
          _i1.WidgetbookUseCase(
            name: 'Plain',
            builder: _i10.useCaseRioButtonPlain,
          ),
          _i1.WidgetbookUseCase(
            name: 'Soft',
            builder: _i10.useCaseRioButtonSoft,
          ),
          _i1.WidgetbookUseCase(
            name: 'Solid',
            builder: _i10.useCaseRioButtonSolid,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'RioCheckbox',
        useCase: _i1.WidgetbookUseCase(
          name: 'Checkbox',
          builder: _i11.useCaseRioCeckbox,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioIconButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Outlined',
            builder: _i12.useCaseRioIconButtonIconOutlined,
          ),
          _i1.WidgetbookUseCase(
            name: 'Plain',
            builder: _i12.useCaseRioIconButtonPlain,
          ),
          _i1.WidgetbookUseCase(
            name: 'Soft',
            builder: _i12.useCaseRioIconButtonSoft,
          ),
          _i1.WidgetbookUseCase(
            name: 'Solid',
            builder: _i12.useCaseRioIconButtonSolid,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'RioPinField',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i13.useCaseRioPinField,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioTextField',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i14.useCaseRioTextFieldDefault,
          ),
          _i1.WidgetbookUseCase(
            name: 'Filled',
            builder: _i14.useCaseRioTextFieldFilled,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'RioToggleButtons',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Soft',
            builder: _i15.useCaseRioToggleButtonSoft,
          ),
          _i1.WidgetbookUseCase(
            name: 'Solid',
            builder: _i15.useCaseRioToggleButtonSolid,
          ),
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'menus',
    children: [
      _i1.WidgetbookComponent(
        name: 'RioBottomNavigation',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Custom Theme',
            builder: _i16.useCaseBottomNavigationCustomTheme,
          ),
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i16.useCaseBottomNavigation,
          ),
          _i1.WidgetbookUseCase(
            name: 'Default Soft Action',
            builder: _i16.useCaseBottomNavigationDefaultSoft,
          ),
          _i1.WidgetbookUseCase(
            name: 'Hero Animation',
            builder: _i16.useCaseBottomNavigationHeroAnimation,
          ),
          _i1.WidgetbookUseCase(
            name: 'Simplified Hero Dialog',
            builder: _i16.useCaseBottomNavigationSimplifiedHero,
          ),
          _i1.WidgetbookUseCase(
            name: 'With Action',
            builder: _i16.useCaseBottomNavigationWithAction,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'RioMenu',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i17.useCaseRioPopover,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioNavigationBar',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Horizontal',
            builder: _i18.useCaseHorizontal,
          ),
          _i1.WidgetbookUseCase(
            name: 'Vertical',
            builder: _i18.useCaseVertical,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'RioPopover',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i19.useCaseRioPopover,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'RioToolbar',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Custom',
            builder: _i20.useCaseRioToolbarCustom,
          ),
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i20.useCaseRioToolbarDefault,
          ),
        ],
      ),
    ],
  ),
];
