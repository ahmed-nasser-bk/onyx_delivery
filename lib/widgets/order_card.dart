import 'package:flutter/material.dart';
import 'package:onyx_delivery/models/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            order.billSerial,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatus(order.status),
              SizedBox(
                height: 40,
                child: VerticalDivider(thickness: 1, width: 10, color: Colors.grey),
              ),
              _buildItem(context,
                'Total price', 
                '${order.billAmount.length <= 7 ? order.billAmount : order.billAmount.substring(0, 7)} LE'
              ),
              SizedBox(
                height: 40,
                child: VerticalDivider(thickness: 1, width: 20, color: Colors.grey),
              ),
              _buildItem(context, 'Date', order.billDate),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title, String value, {Color? color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: color ?? Color(0xff004F62),
            fontWeight: FontWeight.bold,
          )
        ),
      ],
    );
  }

  Widget _buildStatus(String status) {
    String statusText = '';
    Color statusColor = Colors.grey;

    if (status == '1') {
      statusText = 'Delivered';
      statusColor = Color(0xff004F62);
    } else if (status == '2') {
      statusText = 'Returned';
      statusColor = Colors.red;
    } else if (status == '3') {
      statusText = 'Returned';
      statusColor = Colors.red;
    } 
    else {
      statusText = 'New';
      statusColor = Colors.green;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Status',
          style: TextStyle(fontSize: 12, color: Colors.black54),
        ),
        const SizedBox(height: 4),
        Text(
          statusText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: statusColor,
          ),
        ),
      ],
    );
  }
}

