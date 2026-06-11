import 'package:flutter/material.dart';
import 'package:mvvm_fruit_hub/presentation/auth/login/views/widgets/login_view_bloc_provider.dart';
import 'package:mvvm_fruit_hub/presentation/auth/login/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = "Login";
  @override
  Widget build(BuildContext context) {
    return LoginViewBlocProvider(
      child: Scaffold(backgroundColor: Colors.white, body: LoginViewBody()),
    );
  }
}
