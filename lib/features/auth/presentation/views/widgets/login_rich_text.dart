import 'package:flutter/material.dart';
import 'package:mvvm_fruit_hub/core/utils/app_colors.dart';
import 'package:mvvm_fruit_hub/core/utils/app_styles.dart';
import 'package:mvvm_fruit_hub/features/auth/presentation/views/register_view.dart';

class LoginRichText extends StatelessWidget {
  const LoginRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "do not have account? ",
          style: AppStyles.textStyle16SemiBold.copyWith(
            color: Color(0xff949D9E),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(RegisterView.routeName);
          },
          child: Text(
            "Register",
            style: AppStyles.textStyle16SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
