import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/helpers/spacing.dart';
import 'package:route_task/features/products_screen/ui/widgets/custom_search_bar.dart';
import 'package:route_task/features/products_screen/ui/widgets/product_widget.dart';
import 'package:route_task/features/products_screen/view_model/product_cubit.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().loadProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/route_logo.png"),
              verticalSpace(19),
              Row(
                children: [
                  CustomSearchBar(
                    controller: controller,
                    hintText: "What do you search for?",
                    icon: const Icon(
                      Icons.search,
                      size: 32,
                    ),
                  ),
                  horizontalSpace(16),
                  Image.asset(
                    "assets/images/icon_shopping_cart.png",
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              verticalSpace(16),
              Expanded(
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProductSuccess) {
                      return GridView.builder(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        itemCount: state.productResponse.products?.length ?? 0,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.594,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final product = state.productResponse.products![index];
                          return ProductWidget(products: product);
                        },
                      );
                    } else if (state is ProductFailure) {
                      return Center(child: Text("Error: ${state.error}"));
                    } else {
                      return const Center(child: Text("Unexpected state"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
