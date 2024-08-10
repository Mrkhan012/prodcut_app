import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Ensure you have this package
import 'package:prodcut_app/utils/color.dart';
import 'package:prodcut_app/utils/theme.dart';
import 'package:prodcut_app/view/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to HomeScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => ProductPage()); // Navigate to the product page
    });

    return Scaffold(
      backgroundColor: Colors.white, // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ecommerce.png',
              width: 150.0,
              height: 150.0,
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome to Product App',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: Get.width * 0.045,
              ),
            ),
            const SizedBox(height: 20),
            const SpinKitWave(
              color: kDefaultBlueColor, // Replace with your desired color
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
