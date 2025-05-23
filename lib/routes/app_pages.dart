import 'package:expense_tracker/screens/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../screens/home/home_binding.dart';
import '../screens/home/home_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const HOME = '/home';
}
