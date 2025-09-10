import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/order_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/helper_functions.dart';

class DashBoardController extends GetxController {
  static DashBoardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[150, 200, 100, 250, 180, 220, 170].obs;

  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: OrderStatus.processing,
      totalAmount: 265,
      orderDate: DateTime(2024, 5, 20),
      deliveryDate: DateTime(2024, 5, 20),
    ),
    OrderModel(
      id: 'CWT0025',
      status: OrderStatus.shipped,
      totalAmount: 369,
      orderDate: DateTime(2024, 5, 21),
      deliveryDate: DateTime(2024, 5, 21),
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
    // TODO: implement onInit
    super.onInit();
  }

  void _calculateWeeklySales() {
      weeklySales.value = List<double>.filled(7, 0.0);

      for( var order in orders) {
        final DateTime orderWeekStart = THelperFunctions.getStartOfWeek(order.orderDate);

        if(orderWeekStart.isBefore(DateTime.now()) && orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
          int index = (order.orderDate.weekday -1) % 7;

          index = index < 0 ? index + 7 : index;

          weeklySales[index] += order.totalAmount;
          
          print('OrderDate: ${order.orderDate}, CurrentWeekDay: $orderWeekStart, Index: $index');
        }
      }
      print('Weekly Sales: $weeklySales');
  }
}