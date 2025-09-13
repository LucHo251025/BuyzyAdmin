import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/helper_functions.dart';

class OrderModel {
  final String id;
  final String userId;
  final String docId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final DateTime? deliveryDate;
  final String paymentMethod;

  OrderModel({
    required this.id,
    this.userId = '',
    this.docId = '',
    this.paymentMethod = 'Paypal',
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.deliveryDate,
  });

  String get formattedOrderDate => THelperFunctions.getFormattedDate(
      orderDate); // nếu helper tên khác, sửa ở đây

  String get formattedDeliveryDate => deliveryDate != null
      ? THelperFunctions.getFormattedDate(deliveryDate!)
      : '';

  String get orderStatusText {
    switch (status) {
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.shipped:
        return 'Shipment on the way';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.cancelled:
        return 'Cancelled';
      default:
        return status.toString();
    }
  }

  // --- Factory tạo object rỗng ---
  static OrderModel empty() => OrderModel(
        id: '',
        orderDate: DateTime.now(),
        status: OrderStatus.pending,
        totalAmount: 0,
      );

  // --- JSON serialization ---
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'docId': docId,
      'status': status.index, // lưu index hoặc dùng name
      'totalAmount': totalAmount,
      'orderDate': orderDate.toIso8601String(),
      'paymentMethod': paymentMethod,
      'deliveryDate': deliveryDate?.toIso8601String(),
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    DateTime? _parseDate(dynamic v) {
      if (v == null) return null;
      if (v is DateTime) return v;
      if (v is int) return DateTime.fromMillisecondsSinceEpoch(v);
      if (v is String) return DateTime.parse(v);
      return null;
    }

    final statusVal = json['status'];
    OrderStatus parsedStatus;
    if (statusVal is int) {
      parsedStatus =
          OrderStatus.values[statusVal.clamp(0, OrderStatus.values.length - 1)];
    } else if (statusVal is String) {
      // Nếu lưu dưới dạng tên enum
      parsedStatus = OrderStatus.values.firstWhere(
        (e) =>
            e.toString().split('.').last.toLowerCase() ==
            statusVal.toLowerCase(),
        orElse: () => OrderStatus.pending,
      );
    } else {
      parsedStatus = OrderStatus.pending;
    }

    return OrderModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      docId: json['docId'] ?? '',
      status: parsedStatus,
      totalAmount: (json['totalAmount'] ?? 0).toDouble(),
      orderDate: _parseDate(json['orderDate']) ?? DateTime.now(),
      paymentMethod: json['paymentMethod'] ?? 'Paypal',
      deliveryDate: _parseDate(json['deliveryDate']),
    );
  }

  // --- copyWith ---
  OrderModel copyWith({
    String? id,
    String? userId,
    String? docId,
    OrderStatus? status,
    double? totalAmount,
    DateTime? orderDate,
    String? paymentMethod,
    DateTime? deliveryDate,
  }) {
    return OrderModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      docId: docId ?? this.docId,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      orderDate: orderDate ?? this.orderDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      deliveryDate: deliveryDate ?? this.deliveryDate,
    );
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, status: $status, totalAmount: $totalAmount, orderDate: $orderDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrderModel &&
        other.id == id &&
        other.userId == userId &&
        other.docId == docId &&
        other.status == status &&
        other.totalAmount == totalAmount &&
        other.orderDate == orderDate &&
        other.paymentMethod == paymentMethod &&
        other.deliveryDate == deliveryDate;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      docId.hashCode ^
      status.hashCode ^
      totalAmount.hashCode ^
      orderDate.hashCode ^
      (deliveryDate?.hashCode ?? 0);
}
