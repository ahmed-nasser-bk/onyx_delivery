import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:onyx_delivery/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthService());
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -size.width * 0.2,
              right: -size.width * 0.2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: size.width * 0.45,
                    height: size.width * 0.45,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Positioned(
                    bottom: size.width * 0.08,
                    left: size.width * 0.08,
                    child: IconButton(
                      onPressed: () {
                        // TODO: change language
                      },
                      icon: const Icon(Icons.language, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.08),
                    Align(
                      alignment: Alignment.topLeft,
                      child: SvgPicture.asset(
                        'lib/assets/svgs/flogo.svg',
                        width: size.width * 0.4,
                      ),
                    ),
                
                    SizedBox(height: size.height * 0.1),
                
                    Text(
                      'Welcome Back!',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'Log back into your account',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                
                    SizedBox(height: size.height * 0.04),
                
                    TextField(
                      controller: controller.userController,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: const InputDecoration(
                        hintText: 'User ID',
                      ),
                    ),
                
                    SizedBox(height: size.height * 0.01),
                
                    TextField(
                      controller: controller.passwordController,
                      obscureText: true,
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                
                    SizedBox(height: size.height * 0.01),
                
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Show More'),
                      ),
                    ),
                
                    SizedBox(height: size.height * 0.02),
                
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: GetBuilder<AuthService>(
                        builder: (c) => ElevatedButton(
                          onPressed: c.isLoading ? null : c.checkDeliveryLogin,
                          child: c.isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('Log in', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                
                    SizedBox(height: size.height * 0.02),
                
                    SvgPicture.asset(
                      'lib/assets/svgs/delivery.svg', 
                      height: size.height * 0.2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
