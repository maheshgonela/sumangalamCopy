import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sumangalam/core/base/base_cubit.dart';
import 'package:sumangalam/core/model/failure.dart';


part 'network_request_cubit.freezed.dart';

class NetworkRequestCubit<T, RP> extends AppBaseCubit<NetworkRequestState<T>> {
  NetworkRequestCubit({required this.onRequest})
      : super(_NetworkRequestInitial<T>());

  final Future<Either<Failure, T>> Function(
      RP? params, NetworkRequestState<T> state) onRequest;

  Future<void> request([RP? params]) async {
    emitSafeState(_NetworkRequestLoading<T>());

    final result = await onRequest(params, state);
    result.fold(
      (l) => emitSafeState(_NetworkRequestFailure<T>(l)),
      (r) => emitSafeState(_NetworkRequestSuccess<T>(r)),
    );
  }
}

@freezed
class NetworkRequestState<T> with _$NetworkRequestState<T> {
  const NetworkRequestState._();

  const factory NetworkRequestState.initial() = _NetworkRequestInitial<T>;

  const factory NetworkRequestState.loading() = _NetworkRequestLoading<T>;

  const factory NetworkRequestState.success(T data) = _NetworkRequestSuccess<T>;

  const factory NetworkRequestState.failure(Failure failure) =
      _NetworkRequestFailure<T>;

  bool get isLoading => maybeWhen(orElse: () => false, loading: () => true);

  dynamic get params => T;
}
