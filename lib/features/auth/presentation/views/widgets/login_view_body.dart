import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_fruit_hub/core/functions/show_snack_bar.dart';
import 'package:mvvm_fruit_hub/features/auth/presentation/logic/login_cubit/login_cubit.dart';
import 'package:mvvm_fruit_hub/features/auth/presentation/logic/login_cubit/login_state.dart';
import 'package:mvvm_fruit_hub/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:mvvm_fruit_hub/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:mvvm_fruit_hub/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:mvvm_fruit_hub/features/auth/presentation/views/widgets/login_rich_text.dart';
import 'package:mvvm_fruit_hub/features/home/presentation/views/home_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String email = "";
  String password = "";
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          showSnackBar(context, message: "Success signIn");
          Navigator.of(context).pushNamed(HomeView.routeName);
        } else if (state is FailureLoginState) {
          showSnackBar(context, message: state.errMessage);
        } else if (state is LoadingLoginState) {
          showSnackBar(context, message: "Loading");
        }
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    hintText: "email",
                    onSaved: (value) {
                      email = value ?? "";
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomPasswordField(
                    onSaved: (value) {
                      password = value ?? "";
                    },
                  ),
                  const SizedBox(height: 16),

                  const SizedBox(height: 33),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: CustomButton(
                      text: "SignIn",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context.read<LoginCubit>().signIn(
                            email: email,
                            password: password,
                          );
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 33),
                  LoginRichText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
