import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:route_task/core/routing/routes.dart';
import 'package:route_task/features/products_screen/data/repos/product_repo/product_remote_data_source/product_remote_data_source.dart';
import 'package:route_task/features/products_screen/data/repos/product_repo/prooduct_repo.dart';
import 'package:route_task/features/products_screen/view_model/product_cubit.dart';

import '../../features/products_screen/ui/products_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.productsScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => ProductCubit(ProductRepo(ProductRemoteDataSource(), InternetConnectionChecker())),
                child: const ProductsScreen()));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No Route Defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
