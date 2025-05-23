import 'dart:async';


import 'package:expense_tracker/component/app_colors.dart';
import 'package:expense_tracker/extra/constant.dart';
import 'package:expense_tracker/screens/home_screen.dart';
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final args = Get.arguments;

  late Timer timer;
  @override
  void initState() {
    super.initState();
    // controller.getUserProfile();
    checkLoginState();
  }

  checkLoginState() {
    String? token = Constants.storage.read("token");
    debugPrint('token : $token');
    timer = Timer(
      const Duration(seconds: 3),
      () {
    
        if (token?.isNotEmpty ?? false) {
          Get.offAll(() => const HomeScreen());
        } else {
          Get.offAll(() => LoginScreen());
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.arsenic,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Container(
          height: Get.height,
          width: Get.width,
          color: AppColors.arsenic,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
         Text('AI Expense Tracker',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor)),
              const SizedBox(height: 10),
              const CircularProgressIndicator(
                color: AppColors.mustard
              ),
              const SizedBox(height: 20),
              Text('Powered by AI',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor)),
            ],
          ),
        ),
      ),
    );
  }
}
