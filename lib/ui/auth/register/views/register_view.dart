import 'package:flutter/material.dart';
import 'package:mvvm_fruit_hub/ui/auth/register/views/widgets/register_view_bloc_provider.dart';
import 'package:mvvm_fruit_hub/ui/auth/register/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = "Register";
  @override
  Widget build(BuildContext context) {
    return RegisterViewBlocProvider(
      child: Scaffold(backgroundColor: Colors.white, body: RegisterViewBody()),
    );
  }
}
