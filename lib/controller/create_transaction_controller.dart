import 'dart:developer';

import 'package:expense_tracker/api_network/network_api.dart';
import 'package:expense_tracker/model/all_piechart_model.dart';
import 'package:expense_tracker/model/all_prediction_model.dart';
import 'package:expense_tracker/model/all_transaction_model.dart';

import 'package:expense_tracker/repo/auth_repo.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CreateTransactionController extends GetxController {
  final emailController = TextEditingController();
  final transactionTypeController = TextEditingController();
  final monthController = TextEditingController();
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

AllTransactionModel user = AllTransactionModel();
  Future<void> getAllTransaction(String month) async {
    isLoading.value = true;
    update();
    try {
      Map<String, dynamic> value = await authRepo.getAllTransaction(month);
      // log("${value['lister']}---------------------");
      if (value['success']) {
        isLoading.value = false;
        user =AllTransactionModel.fromJson(value);
        log("$user!!!!!!!!!!!!!!!!!!!!!!!!!");
        update();
      }
    } catch (e) {
      debugPrint("ERROR CAUGHT  $e");
    }
  }
AllPieChartModel pieChart = AllPieChartModel();
  Future<void> getAllPieChart() async {
    isLoading.value = true;
    update();
    try {
      Map<String, dynamic> value = await authRepo.getAllPieChart();
      // log("${value['lister']}---------------------");
      if (value['success']) {
        isLoading.value = false;
        pieChart = AllPieChartModel.fromJson(value);
        log("$user!!!!!!!!!!!!!!!!!!!!!!!!!");
        update();
      }
    } catch (e) {
      debugPrint("ERROR CAUGHT  $e");
    }
  }

 Map<String, double> getPieChartData(AllPieChartModel pieChart) {
  if (pieChart.data != null && pieChart.data!.isNotEmpty) {
    final map = <String, double>{};
    pieChart.data!.first.categories?.forEach((key, value) {
      // skip success or message keys if any accidentally
      if (key.toLowerCase() == 'success' || key.toLowerCase() == 'message') return;
      map[key] = double.tryParse(value) ?? 0.0;
    });
    return map;
  }
  return {};
}

List<AllPredictionModel> predictionList = [];

Future<void> getPredictions() async {
  try {
    isLoading.value = true;
    update();
    Map<String, dynamic> response = await authRepo.getAllPrediction();// <-- replace with your call
    if (response['success']) {
      predictionList = (response['data'] as List)
          .map((e) => AllPredictionModel.fromJson(e))
          .toList();
    }
    isLoading.value = false;
    update();
  } catch (e) {
    debugPrint("Prediction error: $e");
  }
}


 @override
  void onInit() {
    super.onInit();
    // debugPrint("name in controller ${nameController.text}");
   
  getAllTransaction(monthController.text);
  getPredictions();
  getAllPieChart();  }
}
