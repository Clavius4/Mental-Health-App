import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get nicoMoji {
    return copyWith(
      fontFamily: 'Nico Moji',
    );
  }

  TextStyle get epilogue {
    return copyWith(
      fontFamily: 'Epilogue',
    );
  }

  TextStyle get rubik {
    return copyWith(
      fontFamily: 'Rubik',
    );
  }

  TextStyle get alegreya {
    return copyWith(
      fontFamily: 'Alegreya',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get dMSans {
    return copyWith(
      fontFamily: 'DM Sans',
    );
  }

  TextStyle get workSans {
    return copyWith(
      fontFamily: 'Work Sans',
    );
  }

  TextStyle get raleway {
    return copyWith(
      fontFamily: 'Raleway',
    );
  }

  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }

}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodyMediumNicoMojiPrimary =>
      theme.textTheme.bodyMedium!.nicoMoji.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyMediumRubikGray800 =>
      theme.textTheme.bodyMedium!.rubik.copyWith(
        color: appTheme.gray800.withOpacity(0.67),
      );
// Display text style
  static get displayMediumPrimaryContainer =>
      theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
// Headline text style
  static get headlineMediumAlegreya =>
      theme.textTheme.headlineMedium!.alegreya.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get headlineMediumMedium => theme.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get headlineMediumSemiBold => theme.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
// Label text style
  static get labelLargeMontserratPrimary =>
      theme.textTheme.labelLarge!.montserrat.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelMediumEpilogueGray800 =>
      theme.textTheme.labelMedium!.epilogue.copyWith(
        color: appTheme.gray800,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w700,
      );
// Title text style
  static get titleLargeEpilogueGray800 =>
      theme.textTheme.titleLarge!.epilogue.copyWith(
        color: appTheme.gray800,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallEpilogueGray800 =>
      theme.textTheme.titleSmall!.epilogue.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );

  // Body text style
  static get bodyMediumEpilogueBluegray400 =>
      theme.textTheme.bodyMedium!.epilogue.copyWith(
        color: appTheme.blueGray400,
        fontSize: 15.fSize,
      );
  static get bodyMediumGray800 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray800,
  );
  static get bodySmallEpilogueBluegray900 =>
      theme.textTheme.bodySmall!.epilogue.copyWith(
        color: appTheme.blueGray900,
        fontSize: 10.fSize,
      );
  static get bodySmallEpilogueGray50 =>
      theme.textTheme.bodySmall!.epilogue.copyWith(
        color: appTheme.gray50,
      );
  static get bodySmallRubikGray60001 =>
      theme.textTheme.bodySmall!.rubik.copyWith(
        color: appTheme.gray60001.withOpacity(0.6),
      );
  static get bodySmallRubikGray60001_1 =>
      theme.textTheme.bodySmall!.rubik.copyWith(
        color: appTheme.gray60001,
      );
  static get bodySmallRubikGray800 => theme.textTheme.bodySmall!.rubik.copyWith(
    color: appTheme.gray800,
  );
  static get bodySmallRubikGray800_1 =>
      theme.textTheme.bodySmall!.rubik.copyWith(
        color: appTheme.gray800.withOpacity(0.67),
      );
// Epilogue text style
  static get epilogueGray50002 => TextStyle(
    color: appTheme.gray50002,
    fontSize: 7.fSize,
    fontWeight: FontWeight.w400,
  ).epilogue;
// Headline text style
  static get headlineLargeEpilogueBluegray900 =>
      theme.textTheme.headlineLarge!.epilogue.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w800,
      );
  static get headlineSmallEpilogueBluegray900 =>
      theme.textTheme.headlineSmall!.epilogue.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w800,
      );
  static get headlineSmallGray50001 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.gray50001,
  );
// Label text style
  static get labelLargeBold => theme.textTheme.labelLarge!.copyWith(
    fontWeight: FontWeight.w700,
  );
  static get labelLargeEpilogueBluegray900 =>
      theme.textTheme.labelLarge!.epilogue.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w800,
      );
  static get labelLargeEpilogueGray50 =>
      theme.textTheme.labelLarge!.epilogue.copyWith(
        color: appTheme.gray50,
        fontSize: 12.fSize,
      );
  static get labelLargeGray700 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray700,
  );
  static get labelLargeRubikGray800 =>
      theme.textTheme.labelLarge!.rubik.copyWith(
        color: appTheme.gray800.withOpacity(0.67),
        fontSize: 12.fSize,
      );
  static get labelMediumBluegray900 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.blueGray900,
  );
// Title text style
  static get titleMediumBluegray90001 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.blueGray90001,
    fontSize: 18.fSize,
    fontWeight: FontWeight.w500,
  );
  static get titleMediumGray50 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray50,
  );
  static get titleMediumGray50SemiBold => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray50,
    fontSize: 19.fSize,
    fontWeight: FontWeight.w600,
  );
  static get titleSmallBluegray20001 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blueGray20001,
    fontSize: 14.fSize,
  );
  static get titleSmallGray50 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray50,
    fontSize: 14.fSize,
  );
  static get titleSmallRubikGray800 =>
      theme.textTheme.titleSmall!.rubik.copyWith(
        color: appTheme.gray800,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );

}
