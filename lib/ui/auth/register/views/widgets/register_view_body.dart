import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_fruit_hub/ui/core/functions/show_snack_bar.dart';
import 'package:mvvm_fruit_hub/ui/auth/register/cubit/register_cubit.dart/register_cubit.dart';
import 'package:mvvm_fruit_hub/ui/auth/register/cubit/register_cubit.dart/register_state.dart';
import 'package:mvvm_fruit_hub/ui/core/widgets/custom_button.dart';
import 'package:mvvm_fruit_hub/ui/core/widgets/custom_password_field.dart';
import 'package:mvvm_fruit_hub/ui/core/widgets/custom_text_field.dart';
import 'package:mvvm_fruit_hub/ui/home/views/home_view.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String email = "";
  String password = "";
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is LoadingRegisterState) {
          showSnackBar(context, message: "Loading");
        } else if (state is SuccessRegisterState) {
          showSnackBar(context, message: "Success Register");
          Navigator.of(context).pushNamed(HomeView.routeName);
        } else if (state is FailureRegisterState) {
          showSnackBar(context, message: state.errMessage);
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
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: CustomButton(
                      text: "create new account",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context.read<RegisterCubit>().register(
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
                  const SizedBox(height: 26),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
