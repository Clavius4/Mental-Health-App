import 'package:flutter/material.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
