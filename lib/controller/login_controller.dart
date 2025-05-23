import 'dart:developer';

import 'package:expense_tracker/api_network/network_api.dart';
import 'package:expense_tracker/extra/constant.dart';
import 'package:expense_tracker/repo/auth_repo.dart';
import 'package:expense_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class SigninScreenController extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final focusNode = FocusNode();
  final authRepo = AuthRepo();
  var isLoading = false.obs;
  bool get loading => isLoading.value;
  final signInScreenKey = GlobalKey<FormState>();
  final networkService = NetworkApiService();

  void login(String email) async {
    isLoading.value = true;
    try {
      var res = await authRepo.login(
        email,
      );
      log('::::::::$res');
      Constants.storage.write('token', res['data']['token']);

      if (res['success'] == true) {
        // Handle successful login
        // Add your logic here if needed
        isLoading.value = false;
        emailController.clear();
       
        Get.offAll(() => const HomeScreen());
      } else {
        isLoading.value = false;
        log(':::::::::::::${'Error' '${res['message']}'}');
        // Get.snackbar(
        //     colorText: Colors.white, 'Error', '${res['message']}');

     
      }
   
    } catch (e) {
      isLoading.value = false;
      log('$e');
      Get.snackbar(colorText: Colors.white, 'Error', '$e');
    }
  }
}
