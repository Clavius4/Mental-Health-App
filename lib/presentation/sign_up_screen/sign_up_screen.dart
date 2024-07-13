import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DatabaseReference _ref = FirebaseDatabase.instance.ref('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordConfirmController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        String userId = userCredential.user!.uid;

        Map<String, dynamic> userData = {
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'phoneNumber': _phoneController.text,
          'emailAddress': _emailController.text,
          'password': _passwordController.text, // Add password to userData
        };

        // Save user data to Firebase Realtime Database
        await _ref.child(userId).set(userData);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registered successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        _clearFormFields();
        NavigatorService.pushNamed(AppRoutes.logInScreen);

      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to register: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }


  void _clearFormFields() {
    _firstNameController.clear();
    _lastNameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _passwordController.clear();
    _passwordConfirmController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.teal50,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 37.h),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text(
                          "lbl_let_s_start".tr,
                          style: CustomTextStyles.displayMediumPrimaryContainer,
                        ),
                      ),
                    ),
                    SizedBox(height: 48.v),
                    _buildFirstName(context),
                    SizedBox(height: 40.v),
                    _buildLastName(context),
                    SizedBox(height: 40.v),
                    _buildPhoneNumber(context),
                    SizedBox(height: 40.v),
                    CustomTextFormField(
                      controller: _emailController,
                      hintText: "Email Address".tr,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        // if (value == null || !isValidEmail(value, isRequired: true)) {
                        //   return "Please enter a valid email address";
                        // }
                        return null;
                      },
                    ),
                    SizedBox(height: 40.v),
                    CustomTextFormField(
                      controller: _passwordController,
                      hintText: "Password".tr,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      suffix: InkWell(
                        onTap: () {}, // Implement password visibility toggle
                        child: Icon(
                          Icons.visibility,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: 38.v,
                      ),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 40.v),
                    CustomTextFormField(
                      controller: _passwordConfirmController,
                      hintText: "Confirm Password".tr,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      suffix: InkWell(
                        onTap: () {}, // Implement password visibility toggle
                        child: Icon(
                          Icons.visibility,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: 38.v,
                      ),
                      validator: (value) {
                        if (value == null || value != _passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 40.v),
                    _buildRectangle18804(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildSignup(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      actions: [
        Container(
          height: 12.adaptSize,
          width: 12.adaptSize,
          margin: EdgeInsets.symmetric(
            horizontal: 31.h,
            vertical: 22.v,
          ),
          child: Stack(
            alignment: Alignment.center,
          ),
        )
      ],
    );
  }

  Widget _buildFirstName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: CustomTextFormField(
        controller: _firstNameController,
        hintText: "First Name".tr,
        suffix: Container(
          margin: EdgeInsets.only(
            left: 30.h,
            right: 14.h,
            bottom: 20.v,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgLockBlack900,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 44.v,
        ),
        validator: (value) {
          if (!isText(value)) {
            return "Please enter a valid first name";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildLastName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: CustomTextFormField(
        controller: _lastNameController,
        hintText: "Last Name".tr,
        suffix: Container(
          margin: EdgeInsets.only(
            left: 30.h,
            right: 14.h,
            bottom: 20.v,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgLockBlack900,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 44.v,
        ),
        validator: (value) {
          if (!isText(value)) {
            return "Please enter a valid last name";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPhoneNumber(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: CustomTextFormField(
        controller: _phoneController,
        hintText: "Phone Number".tr,
        suffix: Container(
          margin: EdgeInsets.only(
            left: 30.h,
            right: 14.h,
            bottom: 20.v,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.img9055353BxsPhoneCallIcon,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 44.v,
        ),
        validator: (value) {
          // if (!isPhoneNumber(value)) {
          //   return "Please enter a valid phone number";
          // }
          return null;
        },
      ),
    );
  }

  bool _isChecked = false;

  Widget _buildRectangle18804(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(right: 47.h),
        child: CustomCheckboxButton(
          alignment: Alignment.centerLeft,
          text: "I agree to the terms and conditions",
          value: _isChecked,
          padding: EdgeInsets.symmetric(vertical: 1.v),
          onChange: (value) {
            setState(() {
              _isChecked = value;
            });
          },
        ),
      ),
    );
  }


  bool isLoading = false;

  Widget _buildSignup(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () async {
        setState(() {
          isLoading = true;
        });

        await _signUp();

        setState(() {
          isLoading = false;
        });
      },
      text: isLoading ? "" : "Sign Up".tr,
      margin: EdgeInsets.only(
        left: 40.h,
        right: 40.h,
        bottom: 18.v,
      ),
      buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
      rightIcon: isLoading
          ? CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      )
          : null,
    );
  }

}
