
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'font_weight_helper.dart';


abstract class AppTheme {
  static TextStyle font14LightBlueLight = TextStyle(
      fontSize: 14.sp,
    fontWeight: FontWeightHelper.light,
    color: AppColors.descriptionColor,
  );
  static TextStyle font16BlueRegular = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: AppColors.primaryColor,
  );

}