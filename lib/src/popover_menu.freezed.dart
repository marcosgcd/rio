// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popover_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RioMenuItem<T> {
  T get value => throw _privateConstructorUsedError;
  Widget get title => throw _privateConstructorUsedError;
  String? get tooltip => throw _privateConstructorUsedError;
  Widget? get icon => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;

  /// Create a copy of RioMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RioMenuItemCopyWith<T, RioMenuItem<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RioMenuItemCopyWith<T, $Res> {
  factory $RioMenuItemCopyWith(
          RioMenuItem<T> value, $Res Function(RioMenuItem<T>) then) =
      _$RioMenuItemCopyWithImpl<T, $Res, RioMenuItem<T>>;
  @useResult
  $Res call(
      {T value, Widget title, String? tooltip, Widget? icon, Color? color});
}

/// @nodoc
class _$RioMenuItemCopyWithImpl<T, $Res, $Val extends RioMenuItem<T>>
    implements $RioMenuItemCopyWith<T, $Res> {
  _$RioMenuItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RioMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? title = null,
    Object? tooltip = freezed,
    Object? icon = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Widget,
      tooltip: freezed == tooltip
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RioMenuItemImplCopyWith<T, $Res>
    implements $RioMenuItemCopyWith<T, $Res> {
  factory _$$RioMenuItemImplCopyWith(_$RioMenuItemImpl<T> value,
          $Res Function(_$RioMenuItemImpl<T>) then) =
      __$$RioMenuItemImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {T value, Widget title, String? tooltip, Widget? icon, Color? color});
}

/// @nodoc
class __$$RioMenuItemImplCopyWithImpl<T, $Res>
    extends _$RioMenuItemCopyWithImpl<T, $Res, _$RioMenuItemImpl<T>>
    implements _$$RioMenuItemImplCopyWith<T, $Res> {
  __$$RioMenuItemImplCopyWithImpl(
      _$RioMenuItemImpl<T> _value, $Res Function(_$RioMenuItemImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RioMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? title = null,
    Object? tooltip = freezed,
    Object? icon = freezed,
    Object? color = freezed,
  }) {
    return _then(_$RioMenuItemImpl<T>(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Widget,
      tooltip: freezed == tooltip
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$RioMenuItemImpl<T> implements _RioMenuItem<T> {
  _$RioMenuItemImpl(
      {required this.value,
      required this.title,
      this.tooltip,
      this.icon,
      this.color});

  @override
  final T value;
  @override
  final Widget title;
  @override
  final String? tooltip;
  @override
  final Widget? icon;
  @override
  final Color? color;

  @override
  String toString() {
    return 'RioMenuItem<$T>(value: $value, title: $title, tooltip: $tooltip, icon: $icon, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RioMenuItemImpl<T> &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(value), title, tooltip, icon, color);

  /// Create a copy of RioMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RioMenuItemImplCopyWith<T, _$RioMenuItemImpl<T>> get copyWith =>
      __$$RioMenuItemImplCopyWithImpl<T, _$RioMenuItemImpl<T>>(
          this, _$identity);
}

abstract class _RioMenuItem<T> implements RioMenuItem<T> {
  factory _RioMenuItem(
      {required final T value,
      required final Widget title,
      final String? tooltip,
      final Widget? icon,
      final Color? color}) = _$RioMenuItemImpl<T>;

  @override
  T get value;
  @override
  Widget get title;
  @override
  String? get tooltip;
  @override
  Widget? get icon;
  @override
  Color? get color;

  /// Create a copy of RioMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RioMenuItemImplCopyWith<T, _$RioMenuItemImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
