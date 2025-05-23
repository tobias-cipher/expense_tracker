import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runZonedGuarded(
    () async {
      runApp(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              title: "Expense App",
              initialRoute: Routes.SPLASH,
              getPages: AppPages.routes,
              debugShowCheckedModeBanner: false,
              builder: (context, widget) {
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: TextScaler.linear(1.0)),
                  child: widget!,
                );
              },
            );
          },
        ),
      );
    },
    (error, stackTrace) {
      log('Error: $error');
      log('Stack Trace: $stackTrace');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(),
    );
  }
}
