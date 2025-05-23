import 'package:expense_tracker/component/app_colors.dart';
import 'package:expense_tracker/controller/create_transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateTransactionController>(
  init: CreateTransactionController(),
  builder: (controller) {

    return Scaffold(
      backgroundColor: AppColors.arsenic,
      body: Column(
        children: [
        
        ],
      ),
    );
  });  }
}