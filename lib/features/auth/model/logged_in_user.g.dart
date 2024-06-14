// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoggedInUserImpl _$$LoggedInUserImplFromJson(Map<String, dynamic> json) =>
    _$LoggedInUserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      userName: json['username'] as String,
      password: json['password'] as String,
      organization: json['organization'] as String,
      defaultRole: json['defaultRole'] as String,
      organizationName: json[r'organization$_identifier'] as String,
      defaultRoleName: json[r'defaultRole$_identifier'] as String,
      businessPartner: json['businessPartner'] as String?,
      defaultClient: json['defaultClient'] as String? ?? '',
      isLocked: json['locked'] as bool,
      approver: json['approver'] as bool? ?? false,
    );

Map<String, dynamic> _$$LoggedInUserImplToJson(_$LoggedInUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.userName,
      'password': instance.password,
      'organization': instance.organization,
      'defaultRole': instance.defaultRole,
      r'organization$_identifier': instance.organizationName,
      r'defaultRole$_identifier': instance.defaultRoleName,
      'businessPartner': instance.businessPartner,
      'defaultClient': instance.defaultClient,
      'locked': instance.isLocked,
      'approver': instance.approver,
    };
