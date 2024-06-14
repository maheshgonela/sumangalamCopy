import 'dart:convert';


import 'package:sumangalam/core/logger/app_logger.dart';
import 'package:sumangalam/core/network/api_response.dart';
import 'package:sumangalam/core/network/error_pasrser.dart';


typedef ApiObjectParser<T> = T Function(Map<String, dynamic>);

// ignore: one_member_abstracts
abstract class ApiResponseParser<T> {
  ApiResponse<List<T>> parse(
      String response, ApiObjectParser<T> parser, String defErrorMessage);
}

class OpenbravoApiResponseParser<T> implements ApiResponseParser<T> {
  @override
  ApiResponse<List<T>> parse(
      String apiResponse, ApiObjectParser<T> parser, String defErrorMessage) {
    late final Map<String, dynamic> decoded;
    try {
      decoded = json.decode(apiResponse) as Map<String, dynamic>;
      if (!decoded.containsKey('response')) {
        throw FormatException(Errors.unrecognizedResponse);
      }
    } catch (_) {
      throw FormatException(Errors.responseIsNotValidJson);
    }

    final response = decoded['response'] as Map<String, dynamic>;
    if (response['status'] == 0) {
      if (response['data'] is! List<dynamic>) {
        throw FormatException(Errors.unrecognizedResponse);
      }

      final data = response['data'] as List<dynamic>;
      final List<T> result = data
          .map((e) => _nullOrValue(parser, e))
          .where((element) => element != null)
          .map((e) => e!)
          .toList();

      return ApiResponse.success(result);
    } else {
      final error = defaultErrorParser(response, Errors.defaultApiErrorMessage);

      return ApiResponse.failure(error);
    }
  }

  T? _nullOrValue(ApiObjectParser<T> toElement, e) {
    try {
      return toElement(e);
    } on Exception catch (e, st) {
      $logger.error(e.toString(), e, st);

      return null;
    }
  }
}

class Errors {
  static String get noInternet => 'Please check your internet connection';
  static String get emptyApiResponse => 'Received empty response from server';
  static String get defaultApiErrorMessage =>
      'Unfortunately something went wrong. Please try again a moment later';
  static String get unknown => 'Unknown error occurred';
  static String get connectionIssue =>
      'Could not connect to server. Please check your internet';
  static String get internalServerError => 'Internal Server Error';
  static String get unauthorized =>
      'Looks like you do not have access to this information';
  static String get invalidcredentials =>
      'Wrong credentials.\nInvalid Username or Password';
  static String get clientError =>
      'Unfortunately we could not complete the request.';
  static String get responseIsNotValidJson => 'Invalid json response';
  static String get unrecognizedResponse => 'Unsupported response format';
}
