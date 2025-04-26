import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/order_model.dart';

class ApiService {
  final String baseUrl = 'http://mdev.yemensoft.net:8087/OnyxDeliveryService/Service.svc/';

  Future<List<OrderModel>> fetchOrders() async {
    final url = Uri.parse('${baseUrl}GetDeliveryBillsItems');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'Value': {
          'P_DLVRY_NO': '1010',
          'P_LANG_NO': '2',
          'P_BILL_SRL': '',
          'P_PRCSSD_FLG': ''
        }
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      if (jsonResponse['Data'] != null && jsonResponse['Data']['DeliveryBills'] != null) {
        final List<dynamic> bills = jsonResponse['Data']['DeliveryBills'];
        //print(jsonResponse['Data']['DeliveryBills'][0]);
        return bills.map((item) => OrderModel.fromJson(item)).toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load orders: ${response.statusCode}');
    }
  }
}
