import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onyx_delivery/controllers/order_controller.dart';

class CustomToggleTabs extends StatelessWidget {
  const CustomToggleTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final OrderController controller = Get.put(OrderController());

    final tabWidth = (size.width * 0.8) / 2;

    return Container(
      width: size.width * 0.8,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Obx(() => Row(
            children: [
              _buildTab(title: 'New',  index: 0, width: tabWidth, controller: controller),
              _buildTab(title: 'Others', index: 1, width: tabWidth, controller: controller),
            ],
          )),
    );
  }

  Widget _buildTab({
    required String title,
    required int index,
    required double width,
    required OrderController controller,
  }) {
    final isSelected = controller.selectedTab.value == index;

    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF004D61) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
