abstract class RegisterState {}

final class InitialRegisterState extends RegisterState {}

final class SuccessRegisterState extends RegisterState {}

final class FailureRegisterState extends RegisterState {
  final String errMessage;
  FailureRegisterState({required this.errMessage});
}

final class LoadingRegisterState extends RegisterState {}
