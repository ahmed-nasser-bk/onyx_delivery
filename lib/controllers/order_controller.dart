import 'package:get/get.dart';
import '../models/order_model.dart';
import '../services/api_service.dart';

class OrderController extends GetxController {
  var orders = <OrderModel>[].obs;
  var isLoading = false.obs;
  var selectedTab = 0.obs; // default status is new
  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  void fetchOrders() async {
    try {
      isLoading.value = true;
      final fetchedOrders = await _apiService.fetchOrders();
      orders.assignAll(fetchedOrders);
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  // change tabs based on status
  void changeTab(int index) {
    selectedTab.value = index;
  }

  // filtering orders
  List<OrderModel> get filteredOrders {
    List<OrderModel> filtered;
    if (selectedTab.value == 0) {
      // New Tab
      filtered = orders.where((order) => order.status == '0').toList();
    } else {
      // Others Tab
      filtered = orders.where((order) => order.status != '0').toList();
    }
    //sorting orders based on billSerial
    filtered.sort((a, b) {
    int serialA = int.tryParse(a.billSerial) ?? 0;
    int serialB = int.tryParse(b.billSerial) ?? 0;
    return serialB.compareTo(serialA);
  });

  return filtered;
  }
}
