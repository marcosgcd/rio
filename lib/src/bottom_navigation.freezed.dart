// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_navigation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RioNavigationItem {
  String get label => throw _privateConstructorUsedError;
  Widget get icon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RioNavigationItemCopyWith<RioNavigationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RioNavigationItemCopyWith<$Res> {
  factory $RioNavigationItemCopyWith(
          RioNavigationItem value, $Res Function(RioNavigationItem) then) =
      _$RioNavigationItemCopyWithImpl<$Res, RioNavigationItem>;
  @useResult
  $Res call({String label, Widget icon});
}

/// @nodoc
class _$RioNavigationItemCopyWithImpl<$Res, $Val extends RioNavigationItem>
    implements $RioNavigationItemCopyWith<$Res> {
  _$RioNavigationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RioNavigationItemImplCopyWith<$Res>
    implements $RioNavigationItemCopyWith<$Res> {
  factory _$$RioNavigationItemImplCopyWith(_$RioNavigationItemImpl value,
          $Res Function(_$RioNavigationItemImpl) then) =
      __$$RioNavigationItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, Widget icon});
}

/// @nodoc
class __$$RioNavigationItemImplCopyWithImpl<$Res>
    extends _$RioNavigationItemCopyWithImpl<$Res, _$RioNavigationItemImpl>
    implements _$$RioNavigationItemImplCopyWith<$Res> {
  __$$RioNavigationItemImplCopyWithImpl(_$RioNavigationItemImpl _value,
      $Res Function(_$RioNavigationItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? icon = null,
  }) {
    return _then(_$RioNavigationItemImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$RioNavigationItemImpl
    with DiagnosticableTreeMixin
    implements _RioNavigationItem {
  _$RioNavigationItemImpl({required this.label, required this.icon});

  @override
  final String label;
  @override
  final Widget icon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RioNavigationItem(label: $label, icon: $icon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioNavigationItem'))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('icon', icon));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RioNavigationItemImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RioNavigationItemImplCopyWith<_$RioNavigationItemImpl> get copyWith =>
      __$$RioNavigationItemImplCopyWithImpl<_$RioNavigationItemImpl>(
          this, _$identity);
}

abstract class _RioNavigationItem implements RioNavigationItem {
  factory _RioNavigationItem(
      {required final String label,
      required final Widget icon}) = _$RioNavigationItemImpl;

  @override
  String get label;
  @override
  Widget get icon;
  @override
  @JsonKey(ignore: true)
  _$$RioNavigationItemImplCopyWith<_$RioNavigationItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
