import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../models/userprofilelist_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserprofilelistItemWidget extends StatelessWidget {
  UserprofilelistItemWidget(this.userprofilelistItemModelObj, {Key? key})
      : super(
          key: key,
        );

  UserprofilelistItemModel userprofilelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder17,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5.v),
          Row(
            children: [
              CustomImageView(
                imagePath: userprofilelistItemModelObj.userImage!,
                height: 35.adaptSize,
                width: 35.adaptSize,
                radius: BorderRadius.circular(
                  17.h,
                ),
                margin: EdgeInsets.only(bottom: 2.v),
              ),
              Padding(
                padding: EdgeInsets.only(left: 17.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userprofilelistItemModelObj.userName!,
                      style: CustomTextStyles.titleSmallRubikGray800,
                    ),
                    SizedBox(height: 5.v),
                    Text(
                      userprofilelistItemModelObj.userEducation!,
                      style: CustomTextStyles.bodySmallRubikGray800,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 24.v),
          Padding(
            padding: EdgeInsets.only(right: 50.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: userprofilelistItemModelObj.stmay!,
                  height: 17.adaptSize,
                  width: 17.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 6.h,
                    top: 2.v,
                  ),
                  child: Text(
                    userprofilelistItemModelObj.eventDate!,
                    style: CustomTextStyles.bodySmallRubikGray60001_1,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: userprofilelistItemModelObj.stmay1!,
                  height: 18.adaptSize,
                  width: 18.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(
                    userprofilelistItemModelObj.eventTime!,
                    style: CustomTextStyles.bodySmallRubikGray60001_1,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 14.v),
          Padding(
            padding: EdgeInsets.only(right: 76.h),
            child: Row(
              children: [
                CustomElevatedButton(
                  width: 117.h,
                  text: "lbl_reschedule".tr,
                  buttonTextStyle: CustomTextStyles.titleSmallGray50,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 37.h,
                    top: 12.v,
                    bottom: 12.v,
                  ),
                  child: Text(
                    userprofilelistItemModelObj.joinnow!,
                    style: CustomTextStyles.titleSmallBluegray20001,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
