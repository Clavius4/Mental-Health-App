import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_circleimage.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'models/counselllor_matching_model.dart';
import 'provider/counselllor_matching_provider.dart';

class CounselllorMatchingScreen extends StatefulWidget {
  const CounselllorMatchingScreen({Key? key})
      : super(
    key: key,
  );

  @override
  CounselllorMatchingScreenState createState() =>
      CounselllorMatchingScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounselllorMatchingProvider(),
      child: CounselllorMatchingScreen(),
    );
  }
}

class CounselllorMatchingScreenState extends State<CounselllorMatchingScreen> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 15.v),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 25.h),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Counsellor Matching".tr,
                              style: theme.textTheme.headlineMedium!.copyWith(
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                    SizedBox(height: 25.v),
                    Padding(
                      padding: EdgeInsets.only(left: 30.h),
                      child: Text(
                        'Match with Counsellor',
                        style: theme.textTheme.titleMedium!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.v),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 70.v,
      leadingWidth: 60.h,
      leading: AppbarLeadingCircleimage(
        imagePath: ImageConstant.imgEllipse2,
        margin: EdgeInsets.only(
          left: 25.h,
          top: 1.v,
        ),
      ),
      actions: [
        Container(
          height: 30.v,
          width: 32.h,
          margin: EdgeInsets.only(
            left: 12.h,
            right: 12.h,
            bottom: 5.v,
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 20.v,
                width: 19.h,
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(
                  top: 10.v,
                  right: 13.h,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgVectorGray800,
                height: 3.v,
                width: 4.h,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.fromLTRB(7.h, 7.v, 21.h, 20.v),
              ),
            ],
          ),
        )
      ],
    );
  }

}
