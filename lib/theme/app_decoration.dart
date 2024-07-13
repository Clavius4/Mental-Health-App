import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
    color: appTheme.blue50,
  );
  static BoxDecoration get fillDeepPurple => BoxDecoration(
        color: appTheme.deepPurple50,
      );
  static BoxDecoration get fillLightBlue => BoxDecoration(
    color: appTheme.lightBlue,
  );
  static BoxDecoration get fillDeepPurpleA => BoxDecoration(
        color: appTheme.deepPurpleA100,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
    color: appTheme.gray100,
  );
  static BoxDecoration get fillGray10002 => BoxDecoration(
        color: appTheme.gray10002,
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo50,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red50,
      );
  static BoxDecoration get fillTeal => BoxDecoration(
        color: appTheme.teal50,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
    color: appTheme.whiteA700,
  );
// Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.gray100,
        border: Border.all(
          color: appTheme.gray10001,
          width: 1.h,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.black900.withOpacity(0.05),
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      );
  static BoxDecoration get outlineGray600 => BoxDecoration(
    color: appTheme.whiteA700,
    boxShadow: [
      BoxShadow(
        color: appTheme.gray600,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          0,
        ),
      )
    ],
  );

  static BoxDecoration get outlineBlack => BoxDecoration(
    color: appTheme.deepPurpleA100,
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.06),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      )
    ],
  );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
    color: appTheme.whiteA700,
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.06),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      )
    ],
  );

}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder10 => BorderRadius.circular(
        10.h,
      );
// Rounded borders
  static BorderRadius get roundedBorder17 => BorderRadius.circular(
        17.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
  static BorderRadius get roundedBorder0 => BorderRadius.only();
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
    10.h,
  );
  static BorderRadius get roundedBorder28 => BorderRadius.circular(
    28.h,
  );
  static BorderRadius get roundedBorder40 => BorderRadius.circular(
    -40.h,
  );
  static BorderRadius get roundedBorder80 => BorderRadius.circular(
    -80.h,
  );
}
