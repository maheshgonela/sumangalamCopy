import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:sumangalam/constants/http_params.dart';
import 'package:sumangalam/constants/urls.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/core/model/attachment.dart';
import 'package:sumangalam/core/network/api_client.dart';
import 'package:sumangalam/core/network/api_response.dart';
import 'package:sumangalam/core/network/exception.dart';
import 'package:sumangalam/core/network/request_config.dart';
import 'package:sumangalam/features/auth/model/logged_in_user.dart';

typedef ApiCall<T> = Future<ApiResponse<List<T>>> Function(
    RequestConfig<T> config);
typedef StandardApiResponse<T> = Future<Either<Failure, ApiResponse<List<T>>>>;

class BaseApiRepository {
  const BaseApiRepository(this.client);

  final ApiClient client;

  StandardApiResponse<T> get<T>(
    RequestConfig<T> params, {
    bool includeAuthHeader = true,
  }) async {
    try {
      return _request(client.get, params, includeAuthHeader: includeAuthHeader);
    } on Exception catch (e, st) {
      $logger.error('[Api Failure]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  StandardApiResponse<T> post<T>(
    RequestConfig<T> params, {
    bool includeAuthHeader = true,
  }) async {
    return _request(client.post, params, includeAuthHeader: includeAuthHeader);
  }

  StandardApiResponse<T> multiPart<T>(
    RequestConfig<T> params, {
    bool includeAuthHeader = true,
  }) async {
    return _request(
      client.multipartRequest,
      params,
      includeAuthHeader: includeAuthHeader,
    );
  }

  StandardApiResponse<T> _request<T>(
    ApiCall<T> apiCall,
    RequestConfig<T> config, {
    bool includeAuthHeader = true,
  }) async {
    try {
      final Map<String, String> headers = _addAuthHeader(config.headers);
      final requestConfig = config.copyWith(headers: headers);

      final response = await apiCall(requestConfig);
      if (response.isFailed()) {
        return left(Failure(error: response.error!));
      }

      return right(response);
    } on BaseApiException catch (e, st) {
      $logger.error(e.toString(), e, st);

      return left(Failure(error: e.message));
    } on Exception catch (e, st) {
      $logger.error(e.toString(), e, st);

      return left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, String>> fetchAttachment(
    String recordId,
    String fileName,
    String entity,
  ) async {
    final reqParams = {
      'entity_name': entity,
      'name': fileName,
      'record_id': recordId,
    };
    final requestConfig = RequestConfig(
      url: '',
      parser: Attachment.fromJson,
      reqParams: reqParams,
      headers: _addAuthHeader({}),
    );
    final response = await get(requestConfig);

    return response.process(
      (r) => r!.data?.isEmpty ?? true
          ? 'No Image found'.asFailure()
          : right(r.data![0].fileData),
    );
  }

  Future<Either<Failure, String>> fetchQuery(String attribute) async {
    final reqParams = {
      RequestParams.where: "attribute='$attribute'",
      RequestParams.selectedProp: 'searchKey'
    };
    final requestConfig = RequestConfig(
      url: Urls.preferences,
      parser: AppPreference.fromJson,
      reqParams: reqParams,
    );
    final response = await get(requestConfig);

    return await response.processAsync((r) async {
      if (r.data.isNull || r.data!.isEmpty) {
        return 'Preference not found'.asFailure();
      }
      final preferenceValue = r.data![0].searchKey.trim();

      return right(preferenceValue);
    });
  }

  Future<Either<Failure, List<T>>> fetchQueryResponse<T>(
    String attribute,
    T Function(Map<String, dynamic>) parser, {
    Map<String, String>? placeHolders,
  }) async {
    final queryRes = await fetchQuery(attribute);
    if (queryRes.isLeft()) {
      return 'Could not fetch query response'.asFailure();
    }
    final originalQuery = queryRes.getOrElse(() => '');
    if (originalQuery.isEmpty) {
      return 'Could not fetch query response'.asFailure();
    }

    final requestBody = jsonEncode({
      'data': {
        'query': originalQuery,
        if (placeHolders != null) 'placeholders': placeHolders,
      },
    });
    final requestConfig = RequestConfig(
      url: Urls.queryService,
      parser: parser,
      body: requestBody,
    );

    final either = await post(requestConfig);

    return either.process((r) => right(r.data!));
  }
  LoggedInUser user() => $sl.get<LoggedInUser>();


  Map<String, String> _addAuthHeader(Map<String, String>? headers) {
    final headersInternal = headers != null ? {...headers} : <String, String>{};
    if (!headersInternal.containsKey(HttpHeaders.authorizationHeader)) {
       if ($sl.isRegistered<LoggedInUser>()) {
        final loggedInUser = user();
        headersInternal.putIfAbsent(
          HttpHeaders.authorizationHeader,
          () =>
              RestUtils.basicAuth(loggedInUser.userName, loggedInUser.password),
        );
      }
    }

    return headersInternal;
  }
}
