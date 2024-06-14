import 'package:freezed_annotation/freezed_annotation.dart';

part 'logged_in_user.freezed.dart';
part 'logged_in_user.g.dart';

@freezed
class LoggedInUser with _$LoggedInUser {
  const LoggedInUser._();
  const factory LoggedInUser({
    required String id,
    required String name,
    @JsonKey(name: "username") required String userName,
    required String password,
    required String organization,
    required String defaultRole,
    @JsonKey(name: 'organization\$_identifier')
    required String organizationName,
    @JsonKey(name: 'defaultRole\$_identifier') required String defaultRoleName,
    String? businessPartner,
    @JsonKey(defaultValue: '') required String defaultClient,
    @JsonKey(name: 'locked') required bool isLocked,
    @JsonKey(defaultValue: false) required bool approver,
  }) = _LoggedInUser;

  factory LoggedInUser.fromJson(Map<String, dynamic> json) =>
      _$LoggedInUserFromJson(json);
}
