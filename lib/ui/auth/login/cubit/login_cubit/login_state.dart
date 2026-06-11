abstract class LoginState {}

final class InitialLoginState extends LoginState {}

final class SuccessLoginState extends LoginState {}

final class FailureLoginState extends LoginState {
  final String errMessage;

  FailureLoginState({required this.errMessage});
}

final class LoadingLoginState extends LoginState {}
