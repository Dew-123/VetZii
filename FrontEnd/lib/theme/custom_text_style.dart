import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumBluegray700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray700,
        fontSize: 14.fSize,
      );
  static get bodyMediumGray60002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray60002,
        fontSize: 14.fSize,
      );
  static get bodyMediumPoppins => theme.textTheme.bodyMedium!.poppins.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMediumPoppins14 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMediumPoppinsGray60002 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.gray60002,
        fontSize: 14.fSize,
      );
  static get bodyMediumPoppinsff000000 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: Color(0XFF000000),
        fontSize: 14.fSize,
      );
  static get bodySmallBlack90002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90002.withOpacity(0.4),
      );
  static get bodySmallLatoGray800 => theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.gray800,
      );
  static get bodySmallLatoOnPrimary => theme.textTheme.bodySmall!.lato.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodySmallLightgreen700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.lightGreen700,
      );
  static get bodySmallff000000 => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFF000000),
      );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
    fontSize: 13.fSize,
  );
  static get bodyMedium14 => theme.textTheme.bodyMedium!.copyWith(
    fontSize: 14.fSize,
  );
  // Headline text style
  static get headlineSmallBlack90002 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black90002,
        fontWeight: FontWeight.w500,
      );
  // Label text style
  static get labelLargeBlack90002 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90002.withOpacity(0.4),
      );
  static get labelLargeBlack90002_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90002,
      );
  static get labelLargeBlack90002_2 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90002,
      );
  static get labelLargeGray50 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray50,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterBluegray700 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.blueGray700,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterGray60002 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.gray60002,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumGray50 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray50,
      );
  static get labelLargeErrorContainer => theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.errorContainer.withOpacity(1),
    fontSize: 12.fSize,
  );
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.onPrimary,
  );
  // Title text style
  static get titleLargeBluegray900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeInterBluegray900 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.blueGray900,
      );
  static get titleLargeOnErrorContainer => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleLarge_1 => theme.textTheme.titleLarge!;
  static get titleMediumBlack90002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90002.withOpacity(0.64),
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBluegray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900,
      );
  static get titleMediumGray50 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray60001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray60001,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInter => theme.textTheme.titleMedium!.inter.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumLightgreen700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.lightGreen700,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumOnErrorContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumOnErrorContainerMedium =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumff000000 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF000000),
      );
  static get titleSmallBlack90002 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90002,
      );
  static get titleSmallBlack90002Medium => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90002,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallIndigoA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.indigoA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallInterBlack90002 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.black90002,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallInterBluegray700 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.blueGray700,
        fontSize: 14.fSize,
      );
  static get titleSmallInterBluegray900 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.blueGray900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallInterGray60002 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray60002,
        fontSize: 14.fSize,
      );
  static get titleSmallInterOnPrimaryContainer =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallInterOnPrimaryContainer14 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 14.fSize,
      );
  static get titleSmallPoppinsBlack90002 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black90002,
        fontSize: 14.fSize,
      );
  static get titleSmallPoppinsBlack90002Medium =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black90002,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsBlack90002Medium_1 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black90002,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsBlack90002_1 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black90002,
      );
  static get titleSmallPoppinsBluegray200 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray200,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsBluegray400 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray400,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsBluegray900 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray900,
        fontSize: 14.fSize,
      );
  static get titleSmallPoppinsGray50 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray50,
      );
  static get titleSmallPoppinsff000000 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: Color(0XFF000000),
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsffdc2c2c =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: Color(0XFFDC2C2C),
        fontSize: 14.fSize,
      );
  static get titleLargeOnPrimaryContainer =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray900 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray100,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
    fontSize: 15.fSize,
    fontWeight: FontWeight.w600,
  );
}

extension on TextStyle {
  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
