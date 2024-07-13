import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../models/homelist_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomelistItemWidget extends StatelessWidget {
  HomelistItemWidget(this.homelistItemModelObj, {Key? key})
      : super(
          key: key,
        );

  HomelistItemModel homelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 59.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          children: [
            CustomIconButton(
              height: 62.v,
              width: 59.h,
              padding: EdgeInsets.all(12.h),
              child: CustomImageView(
                imagePath: homelistItemModelObj.userone!,
              ),
            ),
            SizedBox(height: 8.v),
            Text(
              homelistItemModelObj.happy!,
              style: theme.textTheme.labelLarge,
            )
          ],
        ),
      ),
    );
  }
}
