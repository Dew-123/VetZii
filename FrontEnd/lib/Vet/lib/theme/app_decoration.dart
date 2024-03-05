import 'package:flutter/material.dart';
import 'package:mihan_s_application1/Vet/lib/core/app_export_vet.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillLime => BoxDecoration(
        color: appTheme.lime300,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  // Outline decorations
  static BoxDecoration get outlineErrorContainer => BoxDecoration(
        color: appTheme.gray100,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.errorContainer,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineErrorContainer1 => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.errorContainer.withOpacity(0.4),
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder39 => BorderRadius.circular(
        39.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL33 => BorderRadius.vertical(
        bottom: Radius.circular(33.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
