import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_fruit_hub/core/services/get_it_service.dart';
import 'package:mvvm_fruit_hub/features/auth/data/repositories/auth_repository/auth_repository.dart';
import 'package:mvvm_fruit_hub/features/auth/presentation/logic/login_cubit/login_cubit.dart';

class LoginViewBlocProvider extends StatelessWidget {
  const LoginViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(authRepo: getIt.get<AuthRepository>()),
      child: child,
    );
  }
}
