import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/custom_toggle_tabs.dart';
import '../../widgets/header_with_avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            HeaderWithAvatar(
              name: 'Ahmed\nOthman',
              headerHeight: size.height * 0.12,
              avatarSize: size.height * 0.12,
            ),

            SizedBox(height: size.height * 0.02),

            //toggle tabs between orders
            const CustomToggleTabs(),

            SizedBox(height: size.height * 0.06),

            // When orders are empty
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'lib/assets/svgs/emptyorder.svg',
                    height: size.height * 0.18,
                  ),
                  const SizedBox(height: 16),
                  const Text('No orders yet'),
                  const SizedBox(height: 8),
                  const Text(
                    "You don't have any orders in your history.",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
} 
