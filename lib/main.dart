import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodcut_app/routes/app_routes.dart'; // Import the routes class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash, 
      getPages: AppRoutes.routes, 
    );
  }
}
