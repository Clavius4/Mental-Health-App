import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../sign_up_screen/sign_up_screen.dart';
import 'provider/log_in_provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  LogInScreenState createState() => LogInScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LogInProvider(),
      child: LogInScreen(),
    );
  }

}

class LogInScreenState extends State<LogInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _ref = FirebaseDatabase.instance.ref('users');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;


  bool isValidEmail(String value, {bool isRequired = false}) {
    if (isRequired && value.isEmpty) {
      return false;
    }
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  bool isValidPassword(String value, {bool isRequired = true}) {
    if (isRequired && (value.isEmpty || value.length < 8)) {
      return false;
    }
    return true;
  }


  @override
  void initState() {
    super.initState();
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
                child: SizedBox(
                  height: 767.v,
                  width: double.maxFinite,
                  child: Stack(
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
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Spacer(),
                              Container(
                                width: 232.h,
                                margin: EdgeInsets.only(right: 63.h),
                                child: Text(
                                  "lbl_welcome_back".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.displayMedium,
                                ),
                              ),
                              SizedBox(height: 58.v),
                            Consumer<LogInProvider>(
                              builder: (context, provider, child) {
                                return CustomTextFormField(
                                  controller: provider.emailController,
                                  hintText: "Email Address".tr,
                                  textInputAction: TextInputAction.done,
                                  suffix: InkWell(
                                    onTap: () {
                                      provider.changePasswordVisibility();
                                    },
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
                                    if (value == null || !isValidEmail(value, isRequired: true)) {
                                      return "Please enter a valid email".tr;
                                    }
                                    return null;
                                  },
                                );
                              },
                            ),
                          SizedBox(height: 34.v),
                              Consumer<LogInProvider>(
                                builder: (context, provider, child) {
                                  return CustomTextFormField(
                                    controller: provider.passwordController,
                                    hintText: "lbl_password".tr,
                                    textInputAction: TextInputAction.done,
                                    textInputType: TextInputType.visiblePassword,
                                    suffix: InkWell(
                                      onTap: () {
                                        provider.changePasswordVisibility();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: 30.h,
                                          top: 14.v,
                                          right: 15.h,
                                        ),
                                        child: CustomImageView(
                                          imagePath: ImageConstant.imgLockicon,
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
                                          !isValidPassword(value, isRequired: true)) {
                                        return "Please enter a valid password".tr;
                                      }
                                      return null;
                                    },
                                    obscureText: provider.isShowPassword,
                                  );
                                },
                              ),
                              SizedBox(height: 34.v),
                              CustomElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  await _login(context);

                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                                text: isLoading ? "" : "lbl_login".tr,
                                buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
                                rightIcon: isLoading
                                    ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                )
                                    : null,
                              ),
                              SizedBox(height: 15.v),
                              TextButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         ForgotPasswordScreen(),
                                  //   ),
                                  // );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  backgroundColor: Colors.transparent,
                                ).copyWith(
                                  overlayColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.pressed))
                                          return Colors.grey.withOpacity(0.2);
                                        return Colors.transparent;
                                      }),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "msg_forgot_password".tr,
                                    style: CustomTextStyles
                                        .labelLargeMontserratPrimary,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  backgroundColor: Colors.transparent,
                                ).copyWith(
                                  overlayColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.pressed))
                                          return Colors.grey.withOpacity(0.2);
                                        return Colors.transparent;
                                      }),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "msg_don_t_have_an_account".tr,
                                    style: CustomTextStyles
                                        .labelLargeMontserratPrimary,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



  Future<void> _login(BuildContext context) async {
    final provider = Provider.of<LogInProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      try {
        DatabaseEvent event = await _ref
            .orderByChild('emailAddress')
            .equalTo(provider.emailController.text)
            .once();

        DataSnapshot snapshot = event.snapshot;

        if (snapshot.value != null) {
          Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
          Map<String, dynamic> userData = {};

          // Iterate over the data to extract the user data
          data.forEach((key, value) {
            if (value is Map) {
              value.forEach((innerKey, innerValue) {
                userData[innerKey.toString()] = innerValue;
              });
            }
          });

          // Debug print to check the retrieved userData
          print('User Data: $userData');

          // Safely retrieve the password
          String? dbPassword = userData['password'] as String?;

          if (dbPassword == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Password not found for this user'),
                backgroundColor: Colors.red,
              ),
            );
            return;
          }

          if (dbPassword == provider.passwordController.text) {
            UserCredential userCredential = await _auth.signInWithEmailAndPassword(
              email: provider.emailController.text,
              password: provider.passwordController.text,
            );

            String userId = userCredential.user!.uid;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Logged In successfully'),
                backgroundColor: Colors.green,
              ),
            );
            NavigatorService.pushNamed(AppRoutes.bottomNavScreen);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Incorrect password'),
                backgroundColor: Colors.red,
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Email not found'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to sign in: $error'),
            backgroundColor: Colors.red,
          ),
        );
        print(error);
      }
    }
  }

}
