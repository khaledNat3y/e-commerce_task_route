import 'package:flutter/material.dart';
import 'package:route_task/core/theming/app_colors.dart';

class CustomAddProductButton extends StatelessWidget {
  const CustomAddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.primaryColor,
      radius: 16,
      child: IconButton(
        onPressed: () {  },
        padding: EdgeInsets.zero,
        color: AppColors.white,
        icon: Icon(Icons.add, size: 32, ),

      ),
    );
  }
}
