import 'package:flutter/material.dart';
import 'package:mvvm_fruit_hub/domain/models/utils/app_styles.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.onSaved,
    this.hintText = "Password",
  });
  final Function(String?)? onSaved;
  final String hintText;
  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: widget.onSaved,
      obscureText: isVisible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 0),
        filled: true,
        fillColor: Color(0xffF9FAFA),
        suffixIcon: GestureDetector(
          onTap: () {
            isVisible = !isVisible;
            setState(() {});
          },
          child: isVisible
              ? Icon(Icons.visibility_off, color: Color(0xffC9CECF))
              : Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
        ),
        hintText: widget.hintText,
        hintStyle: AppStyles.textStyle13Bold.copyWith(color: Color(0xff949D9E)),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        errorBorder: buildOutlineInputBorder(color: Colors.red),
        focusedErrorBorder: buildOutlineInputBorder(color: Colors.red),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({
    Color color = const Color(0xffE6E9EA),
  }) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: color, width: 1),
  );
}
