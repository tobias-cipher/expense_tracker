import 'dart:developer';

import 'package:expense_tracker/api_network/network_api.dart';

import 'package:expense_tracker/repo/auth_repo.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CreateTransactionController extends GetxController {
  final emailController = TextEditingController();
  final transactionTypeController = TextEditingController();
  final amountController = TextEditingController();
  final currentDateController = TextEditingController();
  final categoryController = TextEditingController();
  final focusNode = FocusNode();
  final focusNodeCategory = FocusNode();
  final focusNodeamount = FocusNode();
  final authRepo = AuthRepo();
  var isLoading = false.obs;
  bool get loading => isLoading.value;
  final signInScreenKey = GlobalKey<FormState>();
  final networkService = NetworkApiService();

  void createTransaction(String transactionType, String category , String currentDate , String amount) async {
    isLoading.value = true;
    try {
      var res = await authRepo.createTransaction(
        transactionType,category,currentDate,amount
      );
     

      if (res['success'] == true) {
        // Handle successful login
        // Add your logic here if needed
        isLoading.value = false;
       transactionTypeController.clear();
       categoryController.clear();
       currentDateController.clear();
       amountController.clear();       
        Get.back();
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
