// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Filters _$FiltersFromJson(Map<String, dynamic> json) {
  return _Filters.fromJson(json);
}

/// @nodoc
mixin _$Filters {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'glitem\$_identifier')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FiltersCopyWith<Filters> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiltersCopyWith<$Res> {
  factory $FiltersCopyWith(Filters value, $Res Function(Filters) then) =
      _$FiltersCopyWithImpl<$Res, Filters>;
  @useResult
  $Res call({String id, @JsonKey(name: 'glitem\$_identifier') String name});
}

/// @nodoc
class _$FiltersCopyWithImpl<$Res, $Val extends Filters>
    implements $FiltersCopyWith<$Res> {
  _$FiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FiltersImplCopyWith<$Res> implements $FiltersCopyWith<$Res> {
  factory _$$FiltersImplCopyWith(
          _$FiltersImpl value, $Res Function(_$FiltersImpl) then) =
      __$$FiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, @JsonKey(name: 'glitem\$_identifier') String name});
}

/// @nodoc
class __$$FiltersImplCopyWithImpl<$Res>
    extends _$FiltersCopyWithImpl<$Res, _$FiltersImpl>
    implements _$$FiltersImplCopyWith<$Res> {
  __$$FiltersImplCopyWithImpl(
      _$FiltersImpl _value, $Res Function(_$FiltersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$FiltersImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FiltersImpl implements _Filters {
  _$FiltersImpl(
      {required this.id,
      @JsonKey(name: 'glitem\$_identifier') required this.name});

  factory _$FiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$FiltersImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'glitem\$_identifier')
  final String name;

  @override
  String toString() {
    return 'Filters(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiltersImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FiltersImplCopyWith<_$FiltersImpl> get copyWith =>
      __$$FiltersImplCopyWithImpl<_$FiltersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FiltersImplToJson(
      this,
    );
  }
}

abstract class _Filters implements Filters {
  factory _Filters(
          {required final String id,
          @JsonKey(name: 'glitem\$_identifier') required final String name}) =
      _$FiltersImpl;

  factory _Filters.fromJson(Map<String, dynamic> json) = _$FiltersImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'glitem\$_identifier')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$FiltersImplCopyWith<_$FiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
