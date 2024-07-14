import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/theming/app_colors.dart';

class CustomAddProductButton extends StatefulWidget {
  const CustomAddProductButton({super.key});

  @override
  State<CustomAddProductButton> createState() => _CustomAddProductButtonState();
}

class _CustomAddProductButtonState extends State<CustomAddProductButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 40.h,
      child: FloatingActionButton(
        onPressed: (){
        setState(() {
          isSelected = !isSelected;
        });
      }, backgroundColor: AppColors.primaryColor,
        child: isSelected ? const Icon(Icons.delete_outline, color: AppColors.white, size: 32,) : Icon(Icons.add, color: AppColors.white, size: 32,),),
    );
  }
}
