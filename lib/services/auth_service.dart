import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:onyx_delivery/routes/routes.dart';

class AuthService extends GetxController {

  final userController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  
  Future<void> checkDeliveryLogin() async {
    final userId = userController.text.trim();
    final password = passwordController.text;
    const url = 'http://mdev.yemensoft.net:8087/OnyxDeliveryService/Service.svc/CheckDeliveryLogin';

    // هذا هو الـ Row اللي سترسله
    final Map<String, dynamic> payload = {
      'Value': {
        'P_LANG_NO': '1',
        'P_DLVRY_NO': userId,
        'P_PSSWRD': password,
      }
    };

    if (userId.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error!', 'Please, fill in the fields',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading = true;
    update();

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json', // ضروري عشان يفهم الـ API انك ترسل JSON
        },
        body: jsonEncode(payload),
      );

      final responseData = jsonDecode(response.body);
      if (responseData['Result']['ErrNo'] == 0) {
        // successful
        Get.offAllNamed(AppRoutes.home);
        print('Response: $responseData');
      } else {
        // failed
        Get.snackbar(
          'Login Failed', 
          responseData['Result']['ErrMsg'] ?? 'Invalid credentials',
          snackPosition: SnackPosition.BOTTOM,
        );
        print('Request failed with status: ${responseData['Result']}');
        isLoading = false;
        update();
      }
    } catch (e) {
      isLoading = false;
      update();
      Get.snackbar(
        'Error', 
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Error occurred: $e');
    }
  }

  @override
  void onClose() {
    userController.dispose();
    passwordController.dispose();
    super.onClose();
  }
  
}