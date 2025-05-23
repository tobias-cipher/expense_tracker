import 'package:expense_tracker/api_network/network_api.dart';
import 'package:expense_tracker/component/app_colors.dart';
import 'package:expense_tracker/controller/create_transaction_controller.dart';
import 'package:expense_tracker/model/all_piechart_model.dart';
import 'package:expense_tracker/screens/create_transaction_screen.dart';
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:expense_tracker/screens/prediction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:skeletonizer/skeletonizer.dart';
class HomeScreen extends StatefulWidget {

   HomeScreen({super.key , });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  @override
  Widget build(BuildContext context) {
    
   return GetBuilder<CreateTransactionController>(
  init: CreateTransactionController(),
  builder: (controller) {
    final dataMap = controller.getPieChartData(controller.pieChart);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.arsenic,
        actions: [
          IconButton(
              onPressed: () {
                NetworkApiService.removeToken();
                Get.offAll(() => const LoginScreen());
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: AppColors.whito,
              ))
        ],
      ),
      backgroundColor: AppColors.arsenic,
      body: Skeletonizer(
        enabled: controller.isLoading.value,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Home Screen',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20),
            if (dataMap.isEmpty)
              const Center(
                child: Text(
                  'Loading pie chart data...',
                  style: TextStyle(color: Colors.white),
                ),
              )
            else
              Center(
                child: PieChart(
                  dataMap: dataMap,
                  chartType: ChartType.disc,
                  chartRadius: MediaQuery.of(context).size.width / 2,
                  legendOptions: const LegendOptions(showLegendsInRow: false),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValuesInPercentage: true,
                    showChartValueBackground: false,
                  ),
                ),
              ),
              Gap(10.h),
              ElevatedButton(onPressed: (){
                Get.to(() => const PredictionScreen());
              }, child: Text('lco'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.yellow,
        child: const Icon(
          Icons.add,
          color: AppColors.eerieBlack,
        ),
        onPressed: () {
          Get.to(() => const CreateTransactionScreen());
        },
      ),
    );
  },
);

  }
}
