import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/helpers/spacing.dart';
import 'package:route_task/core/theming/app_colors.dart';
import 'package:route_task/core/theming/app_theme.dart';

import '../../data/model/product_response.dart';
import '../../../../core/widgets/app_loader.dart';
import 'custom_add_product_button.dart';

class ProductWidget extends StatefulWidget {
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
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Column(children: [
        Stack(
           alignment: Alignment.topRight,
          children: [
            CachedNetworkImage(
              imageUrl: widget.products.images![0],
              placeholder: (_, __) => const AppLoader(),
              errorWidget: (_, __, ___) => const Icon(Icons.error),
              width: double.infinity,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * .16,
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
          ],

        ),
        const Spacer(),
        Text(
          widget.products.title ?? "title",
          style: AppTheme.font16BlueRegular.copyWith(color: AppColors.textColor),

        ),
        verticalSpace(5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                "EGP ${widget.products.price}",
                style: AppTheme.font16BlueRegular.copyWith(color: AppColors.textColor),
              ),
            ),
            Text(

              "${(widget.products.price! / (1 - (widget.products.discountPercentage!.toDouble() / 100))).toStringAsFixed(2)}EGP",
              style: const TextStyle(decoration: TextDecoration.lineThrough,fontSize: 12)
                  .copyWith(color: AppColors.descriptionColor.withOpacity(0.6),),

            ),
          ],
        ),
        verticalSpace(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Text(
                "Review (${widget.products.rating})",
                style: AppTheme.font16BlueRegular.copyWith(color: AppColors.textColor),
              ),
              Image.asset("assets/images/star.png"),
            ],),
            const CustomAddProductButton(),
          ],
        ),


      ]),
    );
  }
}
