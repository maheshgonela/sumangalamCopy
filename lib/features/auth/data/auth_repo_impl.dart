import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sumangalam/constants/http_params.dart';
import 'package:sumangalam/constants/messages.dart';
import 'package:sumangalam/constants/urls.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/network/base_api_repo.dart';
import 'package:sumangalam/core/network/request_config.dart';
import 'package:sumangalam/features/auth/data/auth_repo.dart';
import 'package:sumangalam/features/auth/model/logged_in_user.dart';


@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends BaseApiRepository implements AuthRepo {
  const AuthRepoImpl(super.client, this.storage);

  final KeyValueStorage storage;

  @override
  Future<bool> isLoggedIn() async {
    try {
      final user = await storage.getSecureString(LocalKeys.user);
      return (user!.containsValidValue && json.decode(user!) is Map);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not check for persisted user', e, st);
      return (false);
    }
  }

  @override
  AsyncValueOf<LoggedInUser> logIn(String username, String pswd) async {
    final reqParams = {
      RequestParams.where: "username='$username'",
    };
    final requestConfig = RequestConfig(
      url: Urls.user,
      parser: LoggedInUser.fromJson,
      reqParams: reqParams,
      headers: {
        HttpHeaders.authorizationHeader: RestUtils.basicAuth(username, pswd),
      },
    );
    final response = await get(requestConfig);
    return response.processAsync((r) async {
      if (r.data == null || r.data!.isEmpty) {
        return Messages.invalidUser.asFailure();
      }
      final userWithPswd = r.data!.first.copyWith(password: pswd);
      final isApprover = await _isApprover(userWithPswd.id, username, pswd);
      final userApprover = userWithPswd.copyWith(approver: isApprover);
      await _persistUser(userApprover);
      return right(userApprover);
    });
  }

  Future<bool> _isApprover(String id, String username, String pswd) async {
    final requestConfig = RequestConfig(
      url: Urls.approvalUser,
      parser: (p0) => p0,
      reqParams: {RequestParams.where: "user='$id'"},
      headers: {
        HttpHeaders.authorizationHeader: RestUtils.basicAuth(username, pswd),
      },
    );
    final response = await get(requestConfig);
    return response.fold((l) => false, (r) => r.data!.isNotEmpty);
  }

  Future<Either<Failure, bool>> _persistUser(LoggedInUser user) async {
    try {
      final userJson = jsonEncode(user.toJson());
      await storage.setSecureString(LocalKeys.user, userJson);

      return right(true);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not persisted user', e, st);
      return left(const Failure(error: 'Something went wrong'));
    }
  }

  @override
  AsyncValueOf<LoggedInUser> getPersistedUser() async {
    try {
      final userSource = await storage.getSecureString(LocalKeys.user);
      if (userSource.doesNotHaveValue) {
        return left(const Failure(error: 'No user details found'));
      }
      final userData = jsonDecode(userSource!) as Map<String, dynamic>;
      final user = LoggedInUser.fromJson(userData);
      return right(user);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not get persisted user', e, st);
      return left(const Failure(error: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await storage.clearAllValues();
      await storage.clearAllSecureValues();
      return right(true);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not sign out user', e, st);
      return left(const Failure(error: 'Could not sign out'));
    }
  }
}
