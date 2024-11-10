// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_bar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RioNavigationBarItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)
        item,
    required TResult Function(int flex) spacer,
    required TResult Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)
        divider,
    required TResult Function(Widget child) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)?
        item,
    TResult? Function(int flex)? spacer,
    TResult? Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)?
        divider,
    TResult? Function(Widget child)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)?
        item,
    TResult Function(int flex)? spacer,
    TResult Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)?
        divider,
    TResult Function(Widget child)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RioNavigationBarItemItem value) item,
    required TResult Function(RioNavigationBarItemSpacer value) spacer,
    required TResult Function(RioNavigationBarItemDivider value) divider,
    required TResult Function(RioNavigationBarItemCustom value) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RioNavigationBarItemItem value)? item,
    TResult? Function(RioNavigationBarItemSpacer value)? spacer,
    TResult? Function(RioNavigationBarItemDivider value)? divider,
    TResult? Function(RioNavigationBarItemCustom value)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RioNavigationBarItemItem value)? item,
    TResult Function(RioNavigationBarItemSpacer value)? spacer,
    TResult Function(RioNavigationBarItemDivider value)? divider,
    TResult Function(RioNavigationBarItemCustom value)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RioNavigationBarItemCopyWith<$Res> {
  factory $RioNavigationBarItemCopyWith(RioNavigationBarItem value,
          $Res Function(RioNavigationBarItem) then) =
      _$RioNavigationBarItemCopyWithImpl<$Res, RioNavigationBarItem>;
}

/// @nodoc
class _$RioNavigationBarItemCopyWithImpl<$Res,
        $Val extends RioNavigationBarItem>
    implements $RioNavigationBarItemCopyWith<$Res> {
  _$RioNavigationBarItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RioNavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RioNavigationBarItemItemImplCopyWith<$Res> {
  factory _$$RioNavigationBarItemItemImplCopyWith(
          _$RioNavigationBarItemItemImpl value,
          $Res Function(_$RioNavigationBarItemItemImpl) then) =
      __$$RioNavigationBarItemItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Text label,
      Widget icon,
      RioButtonTheme? theme,
      bool selected,
      void Function(BuildContext)? onPressed});
}

/// @nodoc
class __$$RioNavigationBarItemItemImplCopyWithImpl<$Res>
    extends _$RioNavigationBarItemCopyWithImpl<$Res,
        _$RioNavigationBarItemItemImpl>
    implements _$$RioNavigationBarItemItemImplCopyWith<$Res> {
  __$$RioNavigationBarItemItemImplCopyWithImpl(
      _$RioNavigationBarItemItemImpl _value,
      $Res Function(_$RioNavigationBarItemItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of RioNavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? icon = null,
    Object? theme = freezed,
    Object? selected = null,
    Object? onPressed = freezed,
  }) {
    return _then(_$RioNavigationBarItemItemImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as Text,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as RioButtonTheme?,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      onPressed: freezed == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as void Function(BuildContext)?,
    ));
  }
}

/// @nodoc

class _$RioNavigationBarItemItemImpl
    with DiagnosticableTreeMixin
    implements RioNavigationBarItemItem {
  const _$RioNavigationBarItemItemImpl(
      {required this.label,
      required this.icon,
      this.theme,
      this.selected = false,
      this.onPressed});

  @override
  final Text label;
  @override
  final Widget icon;
  @override
  final RioButtonTheme? theme;
  @override
  @JsonKey()
  final bool selected;
  @override
  final void Function(BuildContext)? onPressed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RioNavigationBarItem.item(label: $label, icon: $icon, theme: $theme, selected: $selected, onPressed: $onPressed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioNavigationBarItem.item'))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('theme', theme))
      ..add(DiagnosticsProperty('selected', selected))
      ..add(DiagnosticsProperty('onPressed', onPressed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RioNavigationBarItemItemImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, label, icon, theme, selected, onPressed);

  /// Create a copy of RioNavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RioNavigationBarItemItemImplCopyWith<_$RioNavigationBarItemItemImpl>
      get copyWith => __$$RioNavigationBarItemItemImplCopyWithImpl<
          _$RioNavigationBarItemItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)
        item,
    required TResult Function(int flex) spacer,
    required TResult Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)
        divider,
    required TResult Function(Widget child) custom,
  }) {
    return item(label, icon, theme, selected, onPressed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)?
        item,
    TResult? Function(int flex)? spacer,
    TResult? Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)?
        divider,
    TResult? Function(Widget child)? custom,
  }) {
    return item?.call(label, icon, theme, selected, onPressed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)?
        item,
    TResult Function(int flex)? spacer,
    TResult Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)?
        divider,
    TResult Function(Widget child)? custom,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(label, icon, theme, selected, onPressed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RioNavigationBarItemItem value) item,
    required TResult Function(RioNavigationBarItemSpacer value) spacer,
    required TResult Function(RioNavigationBarItemDivider value) divider,
    required TResult Function(RioNavigationBarItemCustom value) custom,
  }) {
    return item(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RioNavigationBarItemItem value)? item,
    TResult? Function(RioNavigationBarItemSpacer value)? spacer,
    TResult? Function(RioNavigationBarItemDivider value)? divider,
    TResult? Function(RioNavigationBarItemCustom value)? custom,
  }) {
    return item?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RioNavigationBarItemItem value)? item,
    TResult Function(RioNavigationBarItemSpacer value)? spacer,
    TResult Function(RioNavigationBarItemDivider value)? divider,
    TResult Function(RioNavigationBarItemCustom value)? custom,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(this);
    }
    return orElse();
  }
}

abstract class RioNavigationBarItemItem implements RioNavigationBarItem {
  const factory RioNavigationBarItemItem(
          {required final Text label,
          required final Widget icon,
          final RioButtonTheme? theme,
          final bool selected,
          final void Function(BuildContext)? onPressed}) =
      _$RioNavigationBarItemItemImpl;

  Text get label;
  Widget get icon;
  RioButtonTheme? get theme;
  bool get selected;
  void Function(BuildContext)? get onPressed;

  /// Create a copy of RioNavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RioNavigationBarItemItemImplCopyWith<_$RioNavigationBarItemItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RioNavigationBarItemSpacerImplCopyWith<$Res> {
  factory _$$RioNavigationBarItemSpacerImplCopyWith(
          _$RioNavigationBarItemSpacerImpl value,
          $Res Function(_$RioNavigationBarItemSpacerImpl) then) =
      __$$RioNavigationBarItemSpacerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int flex});
}

/// @nodoc
class __$$RioNavigationBarItemSpacerImplCopyWithImpl<$Res>
    extends _$RioNavigationBarItemCopyWithImpl<$Res,
        _$RioNavigationBarItemSpacerImpl>
    implements _$$RioNavigationBarItemSpacerImplCopyWith<$Res> {
  __$$RioNavigationBarItemSpacerImplCopyWithImpl(
      _$RioNavigationBarItemSpacerImpl _value,
      $Res Function(_$RioNavigationBarItemSpacerImpl) _then)
      : super(_value, _then);

  /// Create a copy of RioNavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flex = null,
  }) {
    return _then(_$RioNavigationBarItemSpacerImpl(
      flex: null == flex
          ? _value.flex
          : flex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RioNavigationBarItemSpacerImpl
    with DiagnosticableTreeMixin
    implements RioNavigationBarItemSpacer {
  const _$RioNavigationBarItemSpacerImpl({this.flex = 1});

  @override
  @JsonKey()
  final int flex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RioNavigationBarItem.spacer(flex: $flex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioNavigationBarItem.spacer'))
      ..add(DiagnosticsProperty('flex', flex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RioNavigationBarItemSpacerImpl &&
            (identical(other.flex, flex) || other.flex == flex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flex);

  /// Create a copy of RioNavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RioNavigationBarItemSpacerImplCopyWith<_$RioNavigationBarItemSpacerImpl>
      get copyWith => __$$RioNavigationBarItemSpacerImplCopyWithImpl<
          _$RioNavigationBarItemSpacerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)
        item,
    required TResult Function(int flex) spacer,
    required TResult Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)
        divider,
    required TResult Function(Widget child) custom,
  }) {
    return spacer(flex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)?
        item,
    TResult? Function(int flex)? spacer,
    TResult? Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)?
        divider,
    TResult? Function(Widget child)? custom,
  }) {
    return spacer?.call(flex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)?
        item,
    TResult Function(int flex)? spacer,
    TResult Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)?
        divider,
    TResult Function(Widget child)? custom,
    required TResult orElse(),
  }) {
    if (spacer != null) {
      return spacer(flex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RioNavigationBarItemItem value) item,
    required TResult Function(RioNavigationBarItemSpacer value) spacer,
    required TResult Function(RioNavigationBarItemDivider value) divider,
    required TResult Function(RioNavigationBarItemCustom value) custom,
  }) {
    return spacer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RioNavigationBarItemItem value)? item,
    TResult? Function(RioNavigationBarItemSpacer value)? spacer,
    TResult? Function(RioNavigationBarItemDivider value)? divider,
    TResult? Function(RioNavigationBarItemCustom value)? custom,
  }) {
    return spacer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RioNavigationBarItemItem value)? item,
    TResult Function(RioNavigationBarItemSpacer value)? spacer,
    TResult Function(RioNavigationBarItemDivider value)? divider,
    TResult Function(RioNavigationBarItemCustom value)? custom,
    required TResult orElse(),
  }) {
    if (spacer != null) {
      return spacer(this);
    }
    return orElse();
  }
}

abstract class RioNavigationBarItemSpacer implements RioNavigationBarItem {
  const factory RioNavigationBarItemSpacer({final int flex}) =
      _$RioNavigationBarItemSpacerImpl;

  int get flex;

  /// Create a copy of RioNavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RioNavigationBarItemSpacerImplCopyWith<_$RioNavigationBarItemSpacerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RioNavigationBarItemDividerImplCopyWith<$Res> {
  factory _$$RioNavigationBarItemDividerImplCopyWith(
          _$RioNavigationBarItemDividerImpl value,
          $Res Function(_$RioNavigationBarItemDividerImpl) then) =
      __$$RioNavigationBarItemDividerImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {EdgeInsetsGeometry paddingVertical,
      EdgeInsetsGeometry paddingHorizontal});
}

/// @nodoc
class __$$RioNavigationBarItemDividerImplCopyWithImpl<$Res>
    extends _$RioNavigationBarItemCopyWithImpl<$Res,
        _$RioNavigationBarItemDividerImpl>
    implements _$$RioNavigationBarItemDividerImplCopyWith<$Res> {
  __$$RioNavigationBarItemDividerImplCopyWithImpl(
      _$RioNavigationBarItemDividerImpl _value,
      $Res Function(_$RioNavigationBarItemDividerImpl) _then)
      : super(_value, _then);

  /// Create a copy of RioNavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paddingVertical = null,
    Object? paddingHorizontal = null,
  }) {
    return _then(_$RioNavigationBarItemDividerImpl(
      paddingVertical: null == paddingVertical
          ? _value.paddingVertical
          : paddingVertical // ignore: cast_nullable_to_non_nullable
              as EdgeInsetsGeometry,
      paddingHorizontal: null == paddingHorizontal
          ? _value.paddingHorizontal
          : paddingHorizontal // ignore: cast_nullable_to_non_nullable
              as EdgeInsetsGeometry,
    ));
  }
}

/// @nodoc

class _$RioNavigationBarItemDividerImpl
    with DiagnosticableTreeMixin
    implements RioNavigationBarItemDivider {
  const _$RioNavigationBarItemDividerImpl(
      {this.paddingVertical = EdgeInsets.zero,
      this.paddingHorizontal = EdgeInsets.zero});

  @override
  @JsonKey()
  final EdgeInsetsGeometry paddingVertical;
  @override
  @JsonKey()
  final EdgeInsetsGeometry paddingHorizontal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RioNavigationBarItem.divider(paddingVertical: $paddingVertical, paddingHorizontal: $paddingHorizontal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioNavigationBarItem.divider'))
      ..add(DiagnosticsProperty('paddingVertical', paddingVertical))
      ..add(DiagnosticsProperty('paddingHorizontal', paddingHorizontal));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RioNavigationBarItemDividerImpl &&
            (identical(other.paddingVertical, paddingVertical) ||
                other.paddingVertical == paddingVertical) &&
            (identical(other.paddingHorizontal, paddingHorizontal) ||
                other.paddingHorizontal == paddingHorizontal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, paddingVertical, paddingHorizontal);

  /// Create a copy of RioNavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RioNavigationBarItemDividerImplCopyWith<_$RioNavigationBarItemDividerImpl>
      get copyWith => __$$RioNavigationBarItemDividerImplCopyWithImpl<
          _$RioNavigationBarItemDividerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)
        item,
    required TResult Function(int flex) spacer,
    required TResult Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)
        divider,
    required TResult Function(Widget child) custom,
  }) {
    return divider(paddingVertical, paddingHorizontal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)?
        item,
    TResult? Function(int flex)? spacer,
    TResult? Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)?
        divider,
    TResult? Function(Widget child)? custom,
  }) {
    return divider?.call(paddingVertical, paddingHorizontal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)?
        item,
    TResult Function(int flex)? spacer,
    TResult Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)?
        divider,
    TResult Function(Widget child)? custom,
    required TResult orElse(),
  }) {
    if (divider != null) {
      return divider(paddingVertical, paddingHorizontal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RioNavigationBarItemItem value) item,
    required TResult Function(RioNavigationBarItemSpacer value) spacer,
    required TResult Function(RioNavigationBarItemDivider value) divider,
    required TResult Function(RioNavigationBarItemCustom value) custom,
  }) {
    return divider(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RioNavigationBarItemItem value)? item,
    TResult? Function(RioNavigationBarItemSpacer value)? spacer,
    TResult? Function(RioNavigationBarItemDivider value)? divider,
    TResult? Function(RioNavigationBarItemCustom value)? custom,
  }) {
    return divider?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RioNavigationBarItemItem value)? item,
    TResult Function(RioNavigationBarItemSpacer value)? spacer,
    TResult Function(RioNavigationBarItemDivider value)? divider,
    TResult Function(RioNavigationBarItemCustom value)? custom,
    required TResult orElse(),
  }) {
    if (divider != null) {
      return divider(this);
    }
    return orElse();
  }
}

abstract class RioNavigationBarItemDivider implements RioNavigationBarItem {
  const factory RioNavigationBarItemDivider(
          {final EdgeInsetsGeometry paddingVertical,
          final EdgeInsetsGeometry paddingHorizontal}) =
      _$RioNavigationBarItemDividerImpl;

  EdgeInsetsGeometry get paddingVertical;
  EdgeInsetsGeometry get paddingHorizontal;

  /// Create a copy of RioNavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RioNavigationBarItemDividerImplCopyWith<_$RioNavigationBarItemDividerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RioNavigationBarItemCustomImplCopyWith<$Res> {
  factory _$$RioNavigationBarItemCustomImplCopyWith(
          _$RioNavigationBarItemCustomImpl value,
          $Res Function(_$RioNavigationBarItemCustomImpl) then) =
      __$$RioNavigationBarItemCustomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Widget child});
}

/// @nodoc
class __$$RioNavigationBarItemCustomImplCopyWithImpl<$Res>
    extends _$RioNavigationBarItemCopyWithImpl<$Res,
        _$RioNavigationBarItemCustomImpl>
    implements _$$RioNavigationBarItemCustomImplCopyWith<$Res> {
  __$$RioNavigationBarItemCustomImplCopyWithImpl(
      _$RioNavigationBarItemCustomImpl _value,
      $Res Function(_$RioNavigationBarItemCustomImpl) _then)
      : super(_value, _then);

  /// Create a copy of RioNavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? child = null,
  }) {
    return _then(_$RioNavigationBarItemCustomImpl(
      null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$RioNavigationBarItemCustomImpl
    with DiagnosticableTreeMixin
    implements RioNavigationBarItemCustom {
  const _$RioNavigationBarItemCustomImpl(this.child);

  @override
  final Widget child;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RioNavigationBarItem.custom(child: $child)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioNavigationBarItem.custom'))
      ..add(DiagnosticsProperty('child', child));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RioNavigationBarItemCustomImpl &&
            (identical(other.child, child) || other.child == child));
  }

  @override
  int get hashCode => Object.hash(runtimeType, child);

  /// Create a copy of RioNavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RioNavigationBarItemCustomImplCopyWith<_$RioNavigationBarItemCustomImpl>
      get copyWith => __$$RioNavigationBarItemCustomImplCopyWithImpl<
          _$RioNavigationBarItemCustomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)
        item,
    required TResult Function(int flex) spacer,
    required TResult Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)
        divider,
    required TResult Function(Widget child) custom,
  }) {
    return custom(child);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)?
        item,
    TResult? Function(int flex)? spacer,
    TResult? Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)?
        divider,
    TResult? Function(Widget child)? custom,
  }) {
    return custom?.call(child);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Text label, Widget icon, RioButtonTheme? theme,
            bool selected, void Function(BuildContext)? onPressed)?
        item,
    TResult Function(int flex)? spacer,
    TResult Function(EdgeInsetsGeometry paddingVertical,
            EdgeInsetsGeometry paddingHorizontal)?
        divider,
    TResult Function(Widget child)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(child);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RioNavigationBarItemItem value) item,
    required TResult Function(RioNavigationBarItemSpacer value) spacer,
    required TResult Function(RioNavigationBarItemDivider value) divider,
    required TResult Function(RioNavigationBarItemCustom value) custom,
  }) {
    return custom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RioNavigationBarItemItem value)? item,
    TResult? Function(RioNavigationBarItemSpacer value)? spacer,
    TResult? Function(RioNavigationBarItemDivider value)? divider,
    TResult? Function(RioNavigationBarItemCustom value)? custom,
  }) {
    return custom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RioNavigationBarItemItem value)? item,
    TResult Function(RioNavigationBarItemSpacer value)? spacer,
    TResult Function(RioNavigationBarItemDivider value)? divider,
    TResult Function(RioNavigationBarItemCustom value)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(this);
    }
    return orElse();
  }
}

abstract class RioNavigationBarItemCustom implements RioNavigationBarItem {
  const factory RioNavigationBarItemCustom(final Widget child) =
      _$RioNavigationBarItemCustomImpl;

  Widget get child;

  /// Create a copy of RioNavigationBarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RioNavigationBarItemCustomImplCopyWith<_$RioNavigationBarItemCustomImpl>
      get copyWith => throw _privateConstructorUsedError;
}
