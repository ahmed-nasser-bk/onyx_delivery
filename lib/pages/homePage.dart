import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onyx_delivery/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE9FAFF),
        body: TextButton(
          onPressed: () => Get.offAllNamed(AppRoutes.login),
          child: Text('sign out')
        ),
      ),
    );
  }
}
