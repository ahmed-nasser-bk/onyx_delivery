import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:onyx_delivery/controllers/order_controller.dart';
import 'order_card.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final OrderController orderController = Get.put(OrderController());
    return Expanded(
      child: Obx(() {
        if (orderController.isLoading.value || orderController.orders.isEmpty) {
          return Column(
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
          );
        }
        return ListView.builder(
          itemCount: orderController.filteredOrders.length,
          itemBuilder: (context, index) {
            return OrderCard(order: orderController.filteredOrders[index]);
          },
        );
      }),
    );
  }
}
