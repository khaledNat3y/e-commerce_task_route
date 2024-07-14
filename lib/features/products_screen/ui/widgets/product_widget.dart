import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/helpers/spacing.dart';
import 'package:route_task/core/theming/app_colors.dart';
import 'package:route_task/core/theming/app_theme.dart';

import '../../data/model/product_response.dart';
import 'custom_add_product_button.dart';

class ProductWidget extends StatefulWidget {
  // final String productImage;
  // final String productName;
  // final double price;
  // final double rating;
  // final ProductResponse productsList;
  final Products products;
  const ProductWidget(
      {super.key, required this.products,});

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
            Container(
              width: 200.w,
                height: 200.h,
                child: Image.network(widget.products.images![0])),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.products.title ?? "title",
                      style: AppTheme.font16BlueRegular,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "EGP ${widget.products.price}",
                            style: AppTheme.font16BlueRegular,
                          ),
                        ),
                        horizontalSpace(10),
                        Expanded(
                          child: Text(

                            "${(widget.products.price! / (1 - (widget.products.discountPercentage!.toDouble() / 100))).toStringAsFixed(2)}EGP",
                            style: const TextStyle(decoration: TextDecoration.lineThrough)
                                .copyWith(color: AppColors.primaryColor.withOpacity(0.6)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Review (${widget.products.rating})",
                              style: AppTheme.font16BlueRegular,
                            ),
                            Image.asset("assets/images/star.png"),
                          ],
                        ),
                        const CustomAddProductButton(),
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
