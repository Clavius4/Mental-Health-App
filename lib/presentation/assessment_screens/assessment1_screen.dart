import 'package:flutter/material.dart';
import 'package:heet/core/app_export.dart';
import 'package:heet/presentation/assessment_screens/stress/assessment2_screen.dart';

import '../../core/utils/image_constant.dart';
import '../../widgets/app_bar/appbar_leading_circleimage.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import 'anxiety/assessment2_screen.dart';
import 'depression/assessment2_screen.dart';



class Assessment1Screen extends StatefulWidget {
  const Assessment1Screen({super.key});

  @override
  State<Assessment1Screen> createState() => _Assessment1ScreenState();
}

class _Assessment1ScreenState extends State<Assessment1Screen> {
  @override
  void initState() {

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
                      width: 215.h,
                      margin: EdgeInsets.only(left: 25.h),
                    ),
                    SizedBox(height: 120.v),
                    _buildTodayStack(context, xOffset: 0.0, yOffset: -120.0),
                  ],
                )
              ],
            ),
          ),
        ),
        // bottomNavigationBar: _buildBottomBar(context),
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

  Widget _buildTodayStack(BuildContext context, {double xOffset = 0.0, double yOffset = 0.0}) {
    return Transform.translate(
      offset: Offset(xOffset, yOffset),
      child: Align(
        alignment: Alignment.center,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: EdgeInsets.only(),
          color: appTheme.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Container(
            height: 600.v,
            width: 325.h,
            decoration: AppDecoration.fillLightBlue.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgMaskGroup,
                  height: 31.v,
                  width: 258.h,
                  radius: BorderRadius.circular(15.h),
                  alignment: Alignment.bottomRight,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.v),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select the Mental Problem to be assessed:".tr,
                        style: CustomTextStyles.titleLargeEpilogueGray800,
                      ),
                      SizedBox(height: 10.v),
                      SizedBox(height: 20.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildInfoContainer(context),
                          _buildInfoContainer2(context),
                        ],
                      ),
                      SizedBox(height: 20.v),
                      _buildInfoContainer3(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoContainer(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // Add your onTap functionality here

          Navigator.push(context, MaterialPageRoute(builder: (context) => Assessment2Screen()));

        },
        child: Container(
          width: 200.h,
          height: 100.v,
          padding: EdgeInsets.all(16.h),
          margin: EdgeInsets.symmetric(horizontal: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.h),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "DEPRESSION",
                style: CustomTextStyles.bodyMediumRubikGray800,
              ),
              Text(
                "Let's Get Started ->".tr,
                style: CustomTextStyles.bodyMediumRubikGray800.copyWith(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildInfoContainer2(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // Add your onTap functionality here
          Navigator.push(context, MaterialPageRoute(builder: (context) => Assessment2_1Screen()));
        },
        child: Container(
          width: 50.h,
          height: 100.v,
          padding: EdgeInsets.all(16.h),
          margin: EdgeInsets.symmetric(horizontal: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.h),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ANXIETY",
                style: CustomTextStyles.bodyMediumRubikGray800,
              ),
              Text(
                "Let's Get Started ->".tr,
                style: CustomTextStyles.bodyMediumRubikGray800.copyWith(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoContainer3(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // Add your onTap functionality here
          Navigator.push(context, MaterialPageRoute(builder: (context) => Assessment2_2Screen()));
        },
        child: Container(
          width: 200.h,
          height: 100.v,
          padding: EdgeInsets.all(16.h),
          margin: EdgeInsets.symmetric(horizontal: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.h),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "STRESS",
                style: CustomTextStyles.bodyMediumRubikGray800,
              ),
              Text(
                "Let's Get Started ->".tr,
                style: CustomTextStyles.bodyMediumRubikGray800.copyWith(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }




}
