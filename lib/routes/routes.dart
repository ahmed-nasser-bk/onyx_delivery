import 'package:get/get.dart';
import 'package:onyx_delivery/pages/homePage.dart';
import 'package:onyx_delivery/pages/loginPage.dart';
import 'package:onyx_delivery/pages/splashPage.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';

  static final routes = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: home, page: () => const HomePage()),
  ];
}
