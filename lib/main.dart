
import 'package:expense_tracker/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

void main()async {
   await GetStorage.init(); // ✅ initialize before runApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      child: GetMaterialApp(

 
       
            debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
         
          home: SplashScreen()
      ),
    );
  }
}
