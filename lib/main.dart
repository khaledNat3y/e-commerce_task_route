import 'package:flutter/material.dart';
import 'package:route_task/core/routing/app_router.dart';
import 'package:route_task/features/products_screen/data/repos/product_repo/product_remote_data_source/product_remote_data_sourceImpl.dart';

import 'core/di/di.dart';
import 'features/products_screen/data/model/product_response.dart';
import 'my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp(appRouter: AppRouter(),));
}



