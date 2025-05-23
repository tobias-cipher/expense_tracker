import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<DateTime> dates = RxList();
  Rx<DateTime> selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  final ScrollController dateScrollController = ScrollController();

  @override
  void onInit() {
    DateTime now =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    for (int i = 12; i > 0; i--) {
      dates.add(DateTime(now.year, now.month - i, now.day));
    }
    log(dates.toString());
    super.onInit();
  }

  @override
  void onReady() {
    scrollEnd();
    selectedDate.value = dates.last;
    super.onReady();
  }

  void scrollEnd() {
    dateScrollController.animateTo(
      dateScrollController.position.maxScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }
}
