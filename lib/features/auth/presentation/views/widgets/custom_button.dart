import 'package:flutter/material.dart';
import 'package:mvvm_fruit_hub/core/utils/app_colors.dart';
import 'package:mvvm_fruit_hub/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text(text, style: AppStyles.textStyle16Bold),
    );
  }
}
