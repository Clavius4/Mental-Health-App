import 'package:flutter/material.dart';
import '../models/sign_up_model.dart';

class SignUpProvider extends ChangeNotifier {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  SignUpModel signUpModelObj = SignUpModel();
  bool isShowPassword = true;
  bool rectangle18804 = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordConfirmController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void changeCheckBox1(bool value) {
    rectangle18804 = value;
    notifyListeners();
  }

  void clearFormFields() {
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
  }
}
