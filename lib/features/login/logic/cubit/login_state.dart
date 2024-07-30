part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loginLoading() = LoginLoading;

  const factory LoginState.loginSuccess() = LoginSuccess;
}
