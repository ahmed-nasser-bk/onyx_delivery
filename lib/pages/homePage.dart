import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onyx_delivery/controllers/toggle_tabs_controller.dart';
import 'package:onyx_delivery/widgets/order_list.dart';
import '../../widgets/custom_toggle_tabs.dart';
import '../../widgets/header_with_avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ToggleTabsController tabsController = Get.put(ToggleTabsController());

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

            SizedBox(height: size.height * 0.02),
            
            Obx(() {
              if (tabsController.selectedIndex.value == 0) {
                // New tab
                return const OrderList();
              } else {
                // others tab
                return const OrderList();
              }
            }),
          ],
        ),
      ),
    );
  }
} 
