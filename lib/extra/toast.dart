// ignore: file_names
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToastUtils {
  static void showToast({
    required String message,
    Toast? toastLength = Toast.LENGTH_SHORT,
    ToastGravity? gravity = ToastGravity.BOTTOM,
    int? timeInSecForIosWeb = 1,
    Color? backgroundColor = Colors.black,
    Color? textColor = Colors.white,
    double? fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength!,
      gravity: gravity!,
      timeInSecForIosWeb: timeInSecForIosWeb!,
      backgroundColor: backgroundColor!,
      textColor: textColor!,
      fontSize: fontSize!.sp,
    );
  }

  // success :
  static void showToastSuccess({
    required String message,
    Toast? toastLength = Toast.LENGTH_SHORT,
    ToastGravity? gravity = ToastGravity.BOTTOM,
    int? timeInSecForIosWeb = 1,
    Color? backgroundColor =  const Color(0xff1A5091),
    Color? textColor = Colors.white,
    double? fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength!,
      gravity: gravity!,
      timeInSecForIosWeb: timeInSecForIosWeb!,
      backgroundColor: backgroundColor!,
      textColor: textColor!,
      fontSize: fontSize!.sp,
    );
  }
}
