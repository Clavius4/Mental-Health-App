import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../sign_up_screen/sign_up_screen.dart';
import 'models/start_model.dart';
import 'provider/start_provider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key})
      : super(
          key: key,
        );

  @override
  StartScreenState createState() => StartScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StartProvider(),
      child: StartScreen(),
    );
  }
}

class StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 40.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGraphicpart,
                  height: 347.v,
                  width: 343.h,
                  alignment: Alignment.centerRight,
                ),
                SizedBox(height: 58.v),
                Padding(
                  padding: EdgeInsets.only(left: 46.h),
                  child: Text(
                    "lbl_we_are_here".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: 12.v),
                Container(
                  width: 262.h,
                  margin: EdgeInsets.only(left: 46.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_welcome_to".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        TextSpan(
                          text: "msg_heet_our_app_is".tr,
                          style: CustomTextStyles.bodyMediumNicoMojiPrimary,
                        )
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 59.v),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      onTapRowsignup(context);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 39.h),
                      decoration: AppDecoration.outlinePrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomElevatedButton(
                            onPressed: () {
                              onTapRowlogin(context);
                            },
                            width: 147.h,
                            text: "lbl_login".tr,
                            buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 47.h,
                              top: 17.v,
                              bottom: 13.v,
                            ),
                            child: Text(
                              "lbl_signup".tr,
                              style: CustomTextStyles.titleSmallSemiBold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70.v),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "msg_app_version_1_0_0".tr,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                SizedBox(height: 5.v)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapRowlogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.logInScreen,
    );
  }

  void onTapRowsignup(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
  }
}
