import 'package:flutter/material.dart';
import 'package:route_task/core/routing/app_router.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(appRouter: AppRouter(),));
}



