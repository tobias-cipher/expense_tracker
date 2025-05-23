import 'package:expense_tracker/api_network/network_api.dart';
import 'package:expense_tracker/component/app_colors.dart';
import 'package:expense_tracker/screens/create_transaction_screen.dart';
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Text(
            'Home Screen',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton
        (backgroundColor: AppColors.yellow,
        child: const Icon(Icons.add,color: AppColors.eerieBlack,),
        onPressed: () {
      Get.to(
        () => const CreateTransactionScreen());
        },
      ),
     
    );
  }
}
