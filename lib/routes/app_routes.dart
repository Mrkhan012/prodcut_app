import 'package:get/get.dart';
import 'package:prodcut_app/view/home_page.dart';
import 'package:prodcut_app/view/splash_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';

  static final List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: home,
      page: () =>  ProductPage(),
    ),
  ];
}
