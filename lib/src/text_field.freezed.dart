// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RioTextFieldDecoration {
  Widget? get label => throw _privateConstructorUsedError;
  String? get hintText => throw _privateConstructorUsedError;
  String? get helperText => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RioTextFieldDecorationCopyWith<RioTextFieldDecoration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RioTextFieldDecorationCopyWith<$Res> {
  factory $RioTextFieldDecorationCopyWith(RioTextFieldDecoration value,
          $Res Function(RioTextFieldDecoration) then) =
      _$RioTextFieldDecorationCopyWithImpl<$Res, RioTextFieldDecoration>;
  @useResult
  $Res call(
      {Widget? label, String? hintText, String? helperText, String? errorText});
}

/// @nodoc
class _$RioTextFieldDecorationCopyWithImpl<$Res,
        $Val extends RioTextFieldDecoration>
    implements $RioTextFieldDecorationCopyWith<$Res> {
  _$RioTextFieldDecorationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? hintText = freezed,
    Object? helperText = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as Widget?,
      hintText: freezed == hintText
          ? _value.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String?,
      helperText: freezed == helperText
          ? _value.helperText
          : helperText // ignore: cast_nullable_to_non_nullable
              as String?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RioTextFieldDecorationImplCopyWith<$Res>
    implements $RioTextFieldDecorationCopyWith<$Res> {
  factory _$$RioTextFieldDecorationImplCopyWith(
          _$RioTextFieldDecorationImpl value,
          $Res Function(_$RioTextFieldDecorationImpl) then) =
      __$$RioTextFieldDecorationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Widget? label, String? hintText, String? helperText, String? errorText});
}

/// @nodoc
class __$$RioTextFieldDecorationImplCopyWithImpl<$Res>
    extends _$RioTextFieldDecorationCopyWithImpl<$Res,
        _$RioTextFieldDecorationImpl>
    implements _$$RioTextFieldDecorationImplCopyWith<$Res> {
  __$$RioTextFieldDecorationImplCopyWithImpl(
      _$RioTextFieldDecorationImpl _value,
      $Res Function(_$RioTextFieldDecorationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? hintText = freezed,
    Object? helperText = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_$RioTextFieldDecorationImpl(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as Widget?,
      hintText: freezed == hintText
          ? _value.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String?,
      helperText: freezed == helperText
          ? _value.helperText
          : helperText // ignore: cast_nullable_to_non_nullable
              as String?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RioTextFieldDecorationImpl
    with DiagnosticableTreeMixin
    implements _RioTextFieldDecoration {
  const _$RioTextFieldDecorationImpl(
      {this.label, this.hintText, this.helperText, this.errorText});

  @override
  final Widget? label;
  @override
  final String? hintText;
  @override
  final String? helperText;
  @override
  final String? errorText;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RioTextFieldDecoration(label: $label, hintText: $hintText, helperText: $helperText, errorText: $errorText)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RioTextFieldDecoration'))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('hintText', hintText))
      ..add(DiagnosticsProperty('helperText', helperText))
      ..add(DiagnosticsProperty('errorText', errorText));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RioTextFieldDecorationImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.hintText, hintText) ||
                other.hintText == hintText) &&
            (identical(other.helperText, helperText) ||
                other.helperText == helperText) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, label, hintText, helperText, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RioTextFieldDecorationImplCopyWith<_$RioTextFieldDecorationImpl>
      get copyWith => __$$RioTextFieldDecorationImplCopyWithImpl<
          _$RioTextFieldDecorationImpl>(this, _$identity);
}

abstract class _RioTextFieldDecoration implements RioTextFieldDecoration {
  const factory _RioTextFieldDecoration(
      {final Widget? label,
      final String? hintText,
      final String? helperText,
      final String? errorText}) = _$RioTextFieldDecorationImpl;

  @override
  Widget? get label;
  @override
  String? get hintText;
  @override
  String? get helperText;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$$RioTextFieldDecorationImplCopyWith<_$RioTextFieldDecorationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
