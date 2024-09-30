import 'package:e_commerce_app/core/api/api_manager/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/routes_manager/routes.dart';
import 'core/routes_manager/routes_generator.dart';

void main() {
  configureDependencies();
  ApiManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RoutesGenerator.getRoute,
        initialRoute: Routes.splashScreen,
      ),
    );
  }
}
