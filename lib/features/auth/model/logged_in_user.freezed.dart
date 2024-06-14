// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logged_in_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoggedInUser _$LoggedInUserFromJson(Map<String, dynamic> json) {
  return _LoggedInUser.fromJson(json);
}

/// @nodoc
mixin _$LoggedInUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get organization => throw _privateConstructorUsedError;
  String get defaultRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization\$_identifier')
  String get organizationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultRole\$_identifier')
  String get defaultRoleName => throw _privateConstructorUsedError;
  String? get businessPartner => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get defaultClient => throw _privateConstructorUsedError;
  @JsonKey(name: 'locked')
  bool get isLocked => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get approver => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoggedInUserCopyWith<LoggedInUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggedInUserCopyWith<$Res> {
  factory $LoggedInUserCopyWith(
          LoggedInUser value, $Res Function(LoggedInUser) then) =
      _$LoggedInUserCopyWithImpl<$Res, LoggedInUser>;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: "username") String userName,
      String password,
      String organization,
      String defaultRole,
      @JsonKey(name: 'organization\$_identifier') String organizationName,
      @JsonKey(name: 'defaultRole\$_identifier') String defaultRoleName,
      String? businessPartner,
      @JsonKey(defaultValue: '') String defaultClient,
      @JsonKey(name: 'locked') bool isLocked,
      @JsonKey(defaultValue: false) bool approver});
}

/// @nodoc
class _$LoggedInUserCopyWithImpl<$Res, $Val extends LoggedInUser>
    implements $LoggedInUserCopyWith<$Res> {
  _$LoggedInUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userName = null,
    Object? password = null,
    Object? organization = null,
    Object? defaultRole = null,
    Object? organizationName = null,
    Object? defaultRoleName = null,
    Object? businessPartner = freezed,
    Object? defaultClient = null,
    Object? isLocked = null,
    Object? approver = null,
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
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
      defaultRole: null == defaultRole
          ? _value.defaultRole
          : defaultRole // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      defaultRoleName: null == defaultRoleName
          ? _value.defaultRoleName
          : defaultRoleName // ignore: cast_nullable_to_non_nullable
              as String,
      businessPartner: freezed == businessPartner
          ? _value.businessPartner
          : businessPartner // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultClient: null == defaultClient
          ? _value.defaultClient
          : defaultClient // ignore: cast_nullable_to_non_nullable
              as String,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      approver: null == approver
          ? _value.approver
          : approver // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoggedInUserImplCopyWith<$Res>
    implements $LoggedInUserCopyWith<$Res> {
  factory _$$LoggedInUserImplCopyWith(
          _$LoggedInUserImpl value, $Res Function(_$LoggedInUserImpl) then) =
      __$$LoggedInUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: "username") String userName,
      String password,
      String organization,
      String defaultRole,
      @JsonKey(name: 'organization\$_identifier') String organizationName,
      @JsonKey(name: 'defaultRole\$_identifier') String defaultRoleName,
      String? businessPartner,
      @JsonKey(defaultValue: '') String defaultClient,
      @JsonKey(name: 'locked') bool isLocked,
      @JsonKey(defaultValue: false) bool approver});
}

/// @nodoc
class __$$LoggedInUserImplCopyWithImpl<$Res>
    extends _$LoggedInUserCopyWithImpl<$Res, _$LoggedInUserImpl>
    implements _$$LoggedInUserImplCopyWith<$Res> {
  __$$LoggedInUserImplCopyWithImpl(
      _$LoggedInUserImpl _value, $Res Function(_$LoggedInUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userName = null,
    Object? password = null,
    Object? organization = null,
    Object? defaultRole = null,
    Object? organizationName = null,
    Object? defaultRoleName = null,
    Object? businessPartner = freezed,
    Object? defaultClient = null,
    Object? isLocked = null,
    Object? approver = null,
  }) {
    return _then(_$LoggedInUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
      defaultRole: null == defaultRole
          ? _value.defaultRole
          : defaultRole // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      defaultRoleName: null == defaultRoleName
          ? _value.defaultRoleName
          : defaultRoleName // ignore: cast_nullable_to_non_nullable
              as String,
      businessPartner: freezed == businessPartner
          ? _value.businessPartner
          : businessPartner // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultClient: null == defaultClient
          ? _value.defaultClient
          : defaultClient // ignore: cast_nullable_to_non_nullable
              as String,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      approver: null == approver
          ? _value.approver
          : approver // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoggedInUserImpl extends _LoggedInUser {
  const _$LoggedInUserImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: "username") required this.userName,
      required this.password,
      required this.organization,
      required this.defaultRole,
      @JsonKey(name: 'organization\$_identifier')
      required this.organizationName,
      @JsonKey(name: 'defaultRole\$_identifier') required this.defaultRoleName,
      this.businessPartner,
      @JsonKey(defaultValue: '') required this.defaultClient,
      @JsonKey(name: 'locked') required this.isLocked,
      @JsonKey(defaultValue: false) required this.approver})
      : super._();

  factory _$LoggedInUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoggedInUserImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: "username")
  final String userName;
  @override
  final String password;
  @override
  final String organization;
  @override
  final String defaultRole;
  @override
  @JsonKey(name: 'organization\$_identifier')
  final String organizationName;
  @override
  @JsonKey(name: 'defaultRole\$_identifier')
  final String defaultRoleName;
  @override
  final String? businessPartner;
  @override
  @JsonKey(defaultValue: '')
  final String defaultClient;
  @override
  @JsonKey(name: 'locked')
  final bool isLocked;
  @override
  @JsonKey(defaultValue: false)
  final bool approver;

  @override
  String toString() {
    return 'LoggedInUser(id: $id, name: $name, userName: $userName, password: $password, organization: $organization, defaultRole: $defaultRole, organizationName: $organizationName, defaultRoleName: $defaultRoleName, businessPartner: $businessPartner, defaultClient: $defaultClient, isLocked: $isLocked, approver: $approver)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggedInUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.defaultRole, defaultRole) ||
                other.defaultRole == defaultRole) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.defaultRoleName, defaultRoleName) ||
                other.defaultRoleName == defaultRoleName) &&
            (identical(other.businessPartner, businessPartner) ||
                other.businessPartner == businessPartner) &&
            (identical(other.defaultClient, defaultClient) ||
                other.defaultClient == defaultClient) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.approver, approver) ||
                other.approver == approver));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      userName,
      password,
      organization,
      defaultRole,
      organizationName,
      defaultRoleName,
      businessPartner,
      defaultClient,
      isLocked,
      approver);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedInUserImplCopyWith<_$LoggedInUserImpl> get copyWith =>
      __$$LoggedInUserImplCopyWithImpl<_$LoggedInUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoggedInUserImplToJson(
      this,
    );
  }
}

abstract class _LoggedInUser extends LoggedInUser {
  const factory _LoggedInUser(
          {required final String id,
          required final String name,
          @JsonKey(name: "username") required final String userName,
          required final String password,
          required final String organization,
          required final String defaultRole,
          @JsonKey(name: 'organization\$_identifier')
          required final String organizationName,
          @JsonKey(name: 'defaultRole\$_identifier')
          required final String defaultRoleName,
          final String? businessPartner,
          @JsonKey(defaultValue: '') required final String defaultClient,
          @JsonKey(name: 'locked') required final bool isLocked,
          @JsonKey(defaultValue: false) required final bool approver}) =
      _$LoggedInUserImpl;
  const _LoggedInUser._() : super._();

  factory _LoggedInUser.fromJson(Map<String, dynamic> json) =
      _$LoggedInUserImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: "username")
  String get userName;
  @override
  String get password;
  @override
  String get organization;
  @override
  String get defaultRole;
  @override
  @JsonKey(name: 'organization\$_identifier')
  String get organizationName;
  @override
  @JsonKey(name: 'defaultRole\$_identifier')
  String get defaultRoleName;
  @override
  String? get businessPartner;
  @override
  @JsonKey(defaultValue: '')
  String get defaultClient;
  @override
  @JsonKey(name: 'locked')
  bool get isLocked;
  @override
  @JsonKey(defaultValue: false)
  bool get approver;
  @override
  @JsonKey(ignore: true)
  _$$LoggedInUserImplCopyWith<_$LoggedInUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
