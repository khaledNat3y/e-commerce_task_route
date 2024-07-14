import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/helpers/spacing.dart';
import 'package:route_task/core/di/di.dart';
import 'package:route_task/core/networking/api_errors.dart';
import 'package:route_task/core/widgets/app_loader.dart';
import 'package:route_task/features/products_screen/ui/widgets/custom_search_bar.dart';
import 'package:route_task/features/products_screen/ui/widgets/product_widget.dart';
import 'package:route_task/features/products_screen/view_model/product_cubit.dart';

import '../../../core/widgets/error_view.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductCubit viewModel = getIt();
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().loadProductList();
    viewModel.controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    context.read<ProductCubit>().searchProducts(viewModel.controller.text);
  }

  @override
  void dispose() {
    viewModel.controller.removeListener(_onSearchChanged);
    viewModel.controller.dispose();
    super.dispose();
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
                    controller: viewModel.controller,
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
                      return const AppLoader();
                    } else if (state is ProductSuccess || state is ProductSearchSuccess) {
                      final products = state is ProductSuccess
                          ? state.productResponse.products
                          : (state as ProductSearchSuccess).products;
                      return GridView.builder(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        itemCount: products?.length ?? 0,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.594,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final product = products![index];
                          return ProductWidget(products: product);
                        },
                      );
                    } else if (state is ProductFailure) {
                      return ErrorView(error: state.error,);
                    } else {
                      return const Center(child: Text(ApiErrors.internalServerError));
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
