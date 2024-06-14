import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    T? data,
    String? error,
    int? status,
  }) = _ApiResponse;

  const ApiResponse._();

  factory ApiResponse.failure(String error, {int? status}) =>
      ApiResponse(error: error, status: status ?? failureStatus);
  factory ApiResponse.success(T data) =>
      ApiResponse(data: data, status: successStatus);

  bool isSuccess() => data != null && error == null && status! >= 0;

  bool isFailed() =>
      error != null && data == null && status! < 0 || status == 401;

  static int successStatus = 0;
  static int failureStatus = -1;
}
