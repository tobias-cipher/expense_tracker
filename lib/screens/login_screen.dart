import 'package:expense_tracker/component/app_colors.dart';
import 'package:expense_tracker/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../component/button_component.dart';
import 'package:gap/gap.dart';

import '../component/textfiled_component.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  

  final SigninScreenController controller = Get.put(SigninScreenController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.arsenic,
        body: Form(
          key: controller.signInScreenKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Welcome Back!',
                    style: GoogleFonts.manrope(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                const Gap(6),
                Text('Please enter your details to log in.',
                    style: GoogleFonts.manrope(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
                const Gap(46),
                TextFieldComponent(
               controller.   emailController,
                  currentFocus: controller.focusNode,
                  hintText: 'Email Address',
                  // validator: validateEmail,
                  hintTextStyle: GoogleFonts.manrope(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                ),
                Gap(13.h),
                Gap(10.h),
                Obx(()=>
            ButtonComponent(
                    isLoading: controller.isLoading.value,
                    textFontSize: 16,
                    text: 'Login',
                    onTap: () {
                      if (controller.signInScreenKey.currentState!.validate()) {
                        controller.login(controller.emailController.text.trim(),
                  );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
