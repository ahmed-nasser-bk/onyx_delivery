class OrderModel {
  final String billSerial;
  final String billDate;
  final String billAmount;
  final String status;

  OrderModel({
    required this.billSerial,
    required this.billDate,
    required this.billAmount,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      billSerial: json['BILL_SRL']?.toString() ?? '',
      billDate: json['BILL_DATE'] ?? '',
      billAmount: json['BILL_AMT']?.toString() ?? '',
      status: json['DLVRY_STATUS_FLG']?.toString() ?? '',
    );
  }
}
