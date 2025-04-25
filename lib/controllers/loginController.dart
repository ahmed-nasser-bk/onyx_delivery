import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:onyx_delivery/routes/routes.dart';

class LoginController extends GetxController {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://mdev.yemensoft.net:8087/OnyxDeliveryService/Service.svc', // Host URL
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  void login() async {
    final userId = userController.text.trim();
    final password = passwordController.text;

    if (userId.isEmpty || password.isEmpty) {
      Get.snackbar('Error!', 'Please, fill in the fields');
      return;
    }

  // احذفه بعد الاتصال بالسيرفر
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.home); 
    });

    isLoading = true;
    update();

    try {
      final response = await _dio.post(
        'CheckDeliveryLogin',
        data: {
          "DeliveryNo": userId,
          "Password": password,
          "LangNo": 2,
        },
      );

      if (response.data['Success'] == true) {
        // حفظ بيانات الدخول مثلاً بـ SharedPreferences (لاحقاً)
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.snackbar('Login failed', response.data['Message'] ?? 'Error!');
      }
    } catch (e) {
      print('Error details: $e');
      Get.snackbar('Error!', 'Failed to connect to server');
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onClose() {
    userController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
