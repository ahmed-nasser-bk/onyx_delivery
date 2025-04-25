import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:onyx_delivery/routes/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.login); // توجيهه إلى صفحة تسجيل الدخول
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE9FAFF),
        body: Stack(
          children: [
            // الخلفية (خلف الصورة الثانية)
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                'lib/assets/svgs/background.svg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            // الصورة الأولى في منتصف الشاشة
            Center(
              child: SvgPicture.asset(
                'lib/assets/svgs/flogo.svg',
                width: 120,
                height: 120,
              ),
            ),
            // الصورة الثانية في أسفل الشاشة
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                'lib/assets/svgs/slogo.svg',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}