import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_fruit_hub/features/auth/data/repositories/auth_repo.dart';
import 'package:mvvm_fruit_hub/features/auth/presentation/logic/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthRepo authRepo})
    : _authRepo = authRepo,
      super(InitialLoginState());
  final AuthRepo _authRepo;

  Future<void> signIn({required String email, required String password}) async {
    emit(LoadingLoginState());
    var result = await _authRepo.signIn(email: email, password: password);
    result.fold(
      (failure) => emit(FailureLoginState(errMessage: failure.message)),
      (success) => emit(SuccessLoginState()),
    );
  }
}
