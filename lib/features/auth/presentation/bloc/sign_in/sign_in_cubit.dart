import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/base/base_cubit.dart';
import 'package:sumangalam/core/ext/string_ext.dart';
import 'package:sumangalam/core/model/failure.dart';
import 'package:sumangalam/features/auth/data/auth_repo.dart';

part 'sign_in_cubit.freezed.dart';

@injectable
class SignInCubit extends AppBaseCubit<SignInState> {
  SignInCubit(this.repo) : super(const _Initial());

  final AuthRepo repo;

  void login(String username, String password) async {
    emitSafeState(const _Loading());
    if (username.doesNotHaveValue && password.doesNotHaveValue) {
      _emitFailureState('Please enter your username and password to continue');
    } else if (username.doesNotHaveValue) {
      _emitFailureState('Please enter your username');
    } else if (password.doesNotHaveValue) {
      _emitFailureState('Please enter your password');
    } else {
      final response = await repo.logIn(username, password);
      response.fold(
        (l) => _emitFailureState(l.error),
        (r) => emitSafeState(const _Success()),
      );
    }
  }

  void _emitFailureState(String errmsg) {
    final failure = Failure(error: errmsg);
    emitSafeState(_Failure(failure));
  }
}

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading() = _Loading;
  const factory SignInState.success() = _Success;
  const factory SignInState.failure(Failure failure) = _Failure;
}
