import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:expense_tracker/api_network/api_exception.dart';
import 'package:expense_tracker/extra/constant.dart';
import 'package:expense_tracker/extra/toast.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../component/button_component.dart';
import 'base_api_service.dart';


class NetworkApiService extends BaseApiService {
  NetworkApiService({this.displayError = true});
  final bool displayError;

  static final dio = Dio(
    BaseOptions(baseUrl: baseUrl
        // dotenv.env['baseUrl']!
        // connectTimeout: const Duration(seconds: 20),
        // receiveTimeout: const Duration(seconds: 20)
        ),
  );

  @override
  Future getApi({
    required String endpoints,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? header,
  }) async {
    dynamic responseJson;
    try {
      final response = await dio.get(
        endpoints,
        queryParameters: queryParameter,
        options: Options(headers: header),
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 300) {
        responseJson = response.data;
        log('$responseJson json');

        return responseJson;
      }
    } on DioException catch (e) {
      log('${e.response} catch');

      apiErrors(e);
    }
  }

  @override
  Future postApi({
    required String endpoints,
    required Map<String, dynamic> payload,
    Map<String, dynamic>? header,
    // required endPoint,
    // required endPoint,
  }) async {
    dynamic responseJson;
    try {
      debugPrint('payload ==================> $payload');
      final response = await dio.post(
        endpoints,
        data: payload,
        options: Options(headers: header),
      );
      log(':::::::::::$response');
      if (response.statusCode! >= 200 || response.statusCode! <= 300) {
        responseJson = response.data;
        // ToastUtils.showToastSuccess(message: responseJson['message']);
        log('$responseJson json');

        return responseJson;
      }
    } on DioException catch (e) {
      var error = e.response?.data;
      debugPrint('$error catch');
      // return error;
      apiErrors(e);
      rethrow;
    }
  }

  Future logOutApi({
    required String endpoints,
    //required Map<String, dynamic> payload,
    Map<String, dynamic>? header,
    // required endPoint,
  }) async {
    dynamic responseJson;
    try {
      //debugPrint('payload ==================> $payload');
      final response = await dio.post(
        endpoints,
        // data: payload,
        options: Options(headers: header),
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 300) {
        responseJson = response.data;
        ToastUtils.showToastSuccess(message: responseJson['message']);
        log('$responseJson json');

        return responseJson;
      }
    } on DioException catch (e) {
      var error = e.response?.data;
      log('$error catch');
      // return error;
      apiErrors(e);
      rethrow;
    }
  }

  @override
  Future putApi({
    required String endpoints,
    required Map<String, dynamic> payload,
    Map<String, dynamic>? header,
  }) async {
    dynamic responseJson;
    try {
      final response = await dio.put(
        endpoints,
        data: payload,
        options: Options(headers: header),
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 300) {
        responseJson = response.data;
        ToastUtils.showToastSuccess(message: responseJson['message']);
        log('$responseJson json');

        return responseJson;
      }
    } on DioException catch (e) {
      log('${e.response} catch');

      apiErrors(e);
    }
  }

  @override
  Future deleteApi({
    required String endpoints,
    Map<String, dynamic>? payload,
    Map<String, dynamic>? header,
  }) async {
    dynamic responseJson;
    try {
      final response = await dio.delete(
        endpoints,
        data: payload,
        options: Options(headers: header),
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 300) {
        responseJson = response.data;
        Get.snackbar(
          'Success',
          responseJson['message'],
          colorText: const Color(0xff1A5091),
        );
        // ToastUtils.showToastSuccess(message: responseJson['message']);
        log('$responseJson json');

        return responseJson;
      }
    } on DioException catch (e) {
      log('${e.response} catch');

      apiErrors(e);
    }
  }

  static String getToken() {
    log("Token get ${Constants.storage.read('token')}");

    return Constants.storage.read('token');
  }

  static void removeToken() {
    Constants.storage.write('token', '');
  }

  apiErrors(DioException e) {
    if (e.response != null) {
      if (e.response!.data is! List<dynamic>) {
        if (e.response!.data['message'].toString() == 'User not found') {
          Get.dialog(
            errorPopup(),
            barrierDismissible: false,
          );
        } else if (e.response!.data['message'].toString() ==
            'Forbidden - Invalid token') {
          Get.dialog(
            errorPopup(),
            barrierDismissible: false,
          );
        } else {
          displayError
              ? Get.snackbar(
                  colorText: Colors.white,
                  duration: const Duration(seconds: 5),
                  'Error',
                  //  'Carter Boat Lister',
                  e.response!.data['message'] ??
                      e.response!.data['error'] ??
                      e.error ??
                      e.message)
              : null;
        }
        throw e.response!.data['message'] ?? e.response!.data['message'];
      } else {
        dynamic responseJson = e.response!.data['error'];
        return responseJson;
      }
    } else {
      final result = ApiException.getException(e);
      Get.snackbar(
          colorText:  Colors.white,
          duration: const Duration(seconds: 5),
          result[0],
          result[1]);
      throw result[1];
    }
  }

  errorPopup() {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
        title: Text(
          "Your session has expired",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(Get.context!).secondaryHeaderColor,
          ),
        ),
        content: Text(
          "Please Re-login The App",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(Get.context!).secondaryHeaderColor,
          ),
        ),
        actions: [
          // ButtonComponent(
          //     // height: 38.h,
          //     onPressed: () async {
          //       await FirebaseAuthRepo.googleSignOut();
          //       removeToken();
          //       Get.offAll(() => SigninScreen());
          //     },
          //     text: "Ok"),
        ],
        // alignment: Alignment.center,
      ),
    );
  }
}
