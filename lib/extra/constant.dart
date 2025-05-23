import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

String baseUrl = 'http://192.168.100.203:3000/';

class Constants {
  static String baseUrl = 'http://192.168.100.203:3000/';
  static final storage = GetStorage();

 

  static const verticalPadding = 15.0;
  static const horizontalPadding = 10.0;

  static verticalSpace(double vertical) {
    return SizedBox(
      height: vertical,
    );
  }

  static horizontalSpace(double horizontal) {
    return SizedBox(
      width: horizontal,
    );
  }
}
