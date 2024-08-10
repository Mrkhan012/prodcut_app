// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:prodcut_app/utils/theme.dart';

class AppDecoration {
  static BoxDecoration get fillAmberA => BoxDecoration(
        color: appTheme.amberA400,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo100,
      );
  static BoxDecoration get fillIndigo900 => BoxDecoration(
        color: appTheme.indigo900,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Outline decorations
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: appTheme.whiteA700,
       
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray200,
            width: 1,
            // for the same of the d
          ),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: appTheme.gray90019.withOpacity(0.04),
        //     spreadRadius: 2,
        //     blurRadius: 2,
        //     offset: Offset(
        //       0,
        //       2,
        //     ),
        //   ),
        // ],
      );
  static BoxDecoration get outlineGray200 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray200,
          width: 1,
          strokeAlign: strokeAlignOutside,
        ),
      );
  static BoxDecoration get outlineGray2001 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTheme.gray200,
            width: 1,
          ),
          bottom: BorderSide(
            color: appTheme.gray200,
            width: 1,
          ),
        ),
      );
  static BoxDecoration get outlineGray2002 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray200,
          width: 1,
        ),
      );
  static BoxDecoration get outlineGray90019 => BoxDecoration();
  static BoxDecoration get outlineLightBlueA => BoxDecoration(
        border: Border.all(
          color: appTheme.lightBlueA400,
          width: 1,
        ),
      );
  // Fill decorations

  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );

  // Outline decorations

  static BoxDecoration get outlineOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        // boxShadow: [
        //   BoxShadow(
        //     color: theme.colorScheme.onPrimaryContainer,
        //     spreadRadius: 2,
        //     blurRadius: 2,
        //     offset: const Offset(
        //       0,
        //       2,
        //     ),
        //   ),
        // ],
      );

  // Outline decorations
  static BoxDecoration get outlineGrayA => BoxDecoration(
        color: appTheme.whiteA700,
        // boxShadow: [
        //   BoxShadow(
        //     color: appTheme.gray9000a,
        //     spreadRadius: 2,
        //     blurRadius: 2,
        //     offset: const Offset(
        //       0,
        //       2,
        //     ),
        //   ),
        // ],
      );
  static BoxDecoration get outlineIndigo => BoxDecoration(
        border: Border.all(
          color: appTheme.indigo900,
          width: 1,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder50 => BorderRadius.circular(
        50,
      );
  static BorderRadius get circleBorder40 => BorderRadius.circular(
        40,
      );

  // Custom borders
  static BorderRadius get customBorderBL16 => const BorderRadius.vertical(
        bottom: Radius.circular(16),
      );
  static BorderRadius get customBorderBL161 => const BorderRadius.only(
        bottomLeft: Radius.circular(16),
      );
  static BorderRadius get customBorderTL16 => const BorderRadius.vertical(
        top: Radius.circular(16),
      );
  // Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(
        1,
      );
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12,
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8,
      );

  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20,
      );

  static BoxDecoration get fillAmberA => BoxDecoration(
        color: appTheme.amberA400,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo100,
      );
  static BoxDecoration get fillIndigo900 => BoxDecoration(
        color: appTheme.indigo900,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Outline decorations
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: appTheme.whiteA700,
        // boxShadow: [
        //   BoxShadow(
        //     color: appTheme.blueGray90005,
        //     spreadRadius: 2,
        //     blurRadius: 2,
        //     offset: const Offset(
        //       0,
        //       0,
        //     ),
        //   ),
        // ],
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray200,
            width: 1,
          ),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: appTheme.gray90019.withOpacity(0.04),
        //     spreadRadius: 2,
        //     blurRadius: 2,
        //     offset: const Offset(
        //       0,
        //       2,
        //     ),
        //   ),
        // ],
      );
  static BoxDecoration get outlineGray200 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray200,
          width: 1,
          strokeAlign: strokeAlignOutside,
        ),
      );
  static BoxDecoration get outlineGray2001 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTheme.gray200,
            width: 1,
          ),
          bottom: BorderSide(
            color: appTheme.gray200,
            width: 1,
          ),
        ),
      );
  static BoxDecoration get outlineGray2002 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray200,
          width: 1,
        ),
      );
  static BoxDecoration get outlineGray90019 => const BoxDecoration();
  static BoxDecoration get outlineLightBlueA => BoxDecoration(
        border: Border.all(
          color: appTheme.lightBlueA400,
          width: 1,
        ),
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

