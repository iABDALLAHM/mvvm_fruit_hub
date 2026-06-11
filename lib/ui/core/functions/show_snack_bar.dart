  import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,{required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: Duration(seconds: 2), content: Text(message)),
    );
  }