import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/order_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/helper_functions.dart';

class DashBoardController extends GetxController {
  static DashBoardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;
  final RxMap<OrderStatus, int> orderStatusData = <OrderStatus, int>{}.obs;
  final RxMap<OrderStatus, double> totalAmounts = <OrderStatus,double>{}.obs;
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: OrderStatus.processing,
      totalAmount: 265,
      orderDate: DateTime.now(),
      deliveryDate: DateTime.now(),
    ),
    OrderModel(
      id: 'CWT0025',
      status: OrderStatus.shipped,
      totalAmount: 369,
      orderDate: DateTime.now(),
      deliveryDate: DateTime.now(),
    ),
    OrderModel(
      id: 'CWT0152',
      status: OrderStatus.delivered,
      totalAmount: 254,
      orderDate: DateTime(2024, 5, 22),
      deliveryDate: DateTime(2024, 5, 22),
    ),
    OrderModel(
      id: 'CWT0265',
      status: OrderStatus.delivered,
      totalAmount: 355,
      orderDate: DateTime(2024, 5, 23),
      deliveryDate: DateTime(2024, 5, 23),
    ),
    OrderModel(
      id: 'CWT1350',
      status: OrderStatus.delivered,
      totalAmount: 115,
      orderDate: DateTime(2024, 5, 24),
      deliveryDate: DateTime(2024, 5, 24),
    ),
  ];
  @override
  void onInit() {
    _calculateWeeklySales();
    _calculateOrderStatusData();
    super.onInit();
  }

  void _calculateWeeklySales() {
      weeklySales.value = List<double>.filled(7, 0.0);

      for( var order in orders) {
        //Lấy ngày bắt đầu tuần của đơn hàng
        final DateTime orderWeekStart = THelperFunctions.getStartOfWeek(order.orderDate);

        //Kiểm tra đơn hàng có thuộc tuần hiện tại không
        if(orderWeekStart.isBefore(DateTime.now()) && orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
          int index = (order.orderDate.weekday -1) % 7;

          index = index < 0 ? index + 7 : index;

          weeklySales[index] += order.totalAmount;
          
          print('OrderDate: ${order.orderDate}, CurrentWeekDay: $orderWeekStart, Index: $index');
        }
      }
      print('Weekly Sales: $weeklySales');
  }

  void _calculateOrderStatusData() {

    orderStatusData.clear();

    totalAmounts.value = { for(var status in OrderStatus.values) status : 0.0 };

    for(var order in orders) {

      final status = order.status;
      // Đếm số đơn hàng theo trạng thái
      orderStatusData[status] = (orderStatusData[status] ?? 0) + 1;

      // Tổng tiền theo trạng thái
      totalAmounts[status] = (totalAmounts[status] ?? 0) + order.totalAmount;
    }
  }

  String getDisplayStatusName(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }
}