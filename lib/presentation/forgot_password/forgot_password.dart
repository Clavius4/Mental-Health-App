import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  bool isValidEmail(String value, {bool isRequired = false}) {
    if (isRequired && value.isEmpty) {
      return false;
    }
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              height: SizeUtils.height,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 40.h,
                              vertical: 85.v,
                            ),
                            decoration: AppDecoration.fillRed,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Spacer(),
                                  Container(
                                    width: 232.h,
                                    margin: EdgeInsets.only(right: 63.h),
                                    child: Text(
                                      "Forgot Password".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.displayMedium,
                                    ),
                                  ),
                                  SizedBox(height: 58.v),
                                  CustomTextFormField(
                                    controller: _emailController,
                                    hintText: "Email Address".tr,
                                    textInputAction: TextInputAction.done,
                                    textInputType: TextInputType.emailAddress,
                                    suffix: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: 30.h,
                                          top: 14.v,
                                          right: 15.h,
                                        ),
                                        child: CustomImageView(
                                          imagePath: ImageConstant.imgLock,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize,
                                        ),
                                      ),
                                    ),
                                    suffixConstraints: BoxConstraints(
                                      maxHeight: 38.v,
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidEmail(value))) {
                                        return "Please Enter a valid Email Address".tr;
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 34.v),
                                  CustomElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ?? false) {
                                        // Perform password reset
                                      }
                                    },
                                    text: "Reset Password".tr,
                                    buttonTextStyle:
                                    CustomTextStyles.titleSmallOnPrimary,
                                  ),
                                  SizedBox(height: 28.v),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgGroup,
                          height: 205.v,
                          width: 261.h,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 59.v),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
