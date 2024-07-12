import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/theming/app_colors.dart';
import 'package:route_task/core/theming/app_theme.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final TextStyle? hintStyle;
  const CustomSearchBar({super.key, required this.controller, required this.hintText, required this.icon, this.hintStyle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        cursorColor: AppColors.primaryColor,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? AppTheme.font14LightBlueLight,
          enabled: true,
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          prefixIcon: icon,
          prefixIconColor: AppColors.primaryColor,
          contentPadding: EdgeInsets.symmetric(vertical: 20.h)
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(64.r),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      );
  }
}
