import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/helpers/spacing.dart';
import 'package:route_task/core/theming/app_colors.dart';
import 'package:route_task/core/theming/app_theme.dart';

import 'custom_add_product_button.dart';

class ProductWidget extends StatefulWidget {
  final String productImage;
  final String productName;
  final double price;
  final double rating;

  const ProductWidget(
      {super.key,
      required this.productImage,
      required this.productName,
      required this.price,
      required this.rating});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.productImage),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: AppTheme.font16BlueRegular,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          "EGP ${widget.price}",
                          style: AppTheme.font16BlueRegular,
                        ),
                        horizontalSpace(10),
                        Text(
                          "2000EGP",
                          style:
                              TextStyle(decoration: TextDecoration.lineThrough)
                                  .copyWith(
                                      color: AppColors.primaryColor
                                          .withOpacity(0.6)),
                        ),
                      ],
                    ),
                    verticalSpace(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Review (${widget.rating})",
                              style: AppTheme.font16BlueRegular,
                            ),
                            Image.asset("assets/images/star.png"),
                          ],
                        ),
                        CustomAddProductButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 5,
          right: 5,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.white,
            child: IconButton(
              onPressed: () {
                setState(() {
                  setState(() {
                    isSelected = !isSelected;
                  });
                });
              },
              isSelected: isSelected,
              icon: isSelected
                  ? Image.asset(
                      "assets/images/heart_selected.png",
                      width: 19.w,
                      height: 18.h,
                    )
                  : Image.asset(
                      "assets/images/heart.png",
                      width: 19.w,
                      height: 18.h,
                    ),
            ),
          ),
        ),
      ]),
    );
  }
}
