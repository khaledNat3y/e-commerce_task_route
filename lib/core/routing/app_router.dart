import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_task/core/routing/routes.dart';

import '../../features/products_screen/ui/products_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch(settings.name) {
      case Routes.productsScreen:
        return MaterialPageRoute(builder: (_) => const ProductsScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text("No Route Defined for ${settings.name}"),
          ),
        ));
    }
  }
}