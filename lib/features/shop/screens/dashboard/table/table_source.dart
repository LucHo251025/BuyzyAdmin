import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:universal_html/js_util.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/dashbroad/dashboard_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/helper_functions.dart';

class OrderRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    final order = DashBoardController.orders[index];
    return DataRow2(cells: [
      DataCell(
        Text(
          order.id,
            style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: TColors.primary),
        )
      ),
      DataCell(Text(order.formattedOrderDate)),
      DataCell(Text('5 Items')),
      DataCell(
        TRoundedContainer(
          radius: TSizes.cardRadiusSm,
          padding: EdgeInsets.symmetric(vertical: TSizes.xs, horizontal: TSizes.md),
          backgroundColor: THelperFunctions.getOrderStatusColor(order.status).withOpacity(0.1),
          child: Text(
            order.status.name.capitalize.toString(),
            style: TextStyle(color: THelperFunctions.getOrderStatusColor(order.status)),
          ),
        )
      ),
      
      DataCell(Text('\$${order.totalAmount}'))
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => DashBoardController.orders.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}