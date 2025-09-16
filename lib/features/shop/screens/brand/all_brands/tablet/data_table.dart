import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/data_table/paginated_data_table.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/all_brands/tablet/data_source.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';

class BrandTable extends StatelessWidget {
  const BrandTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(columns: [
      DataColumn2(
        label: Text('Brand'),
        fixedWidth: TDeviceUtils.isDesktopScreen(Get.context!) ? null : 200,
      ),
      DataColumn2(label: Text('Categories')),
      DataColumn2(label: Text('Featured'),fixedWidth: TDeviceUtils.isMobileScreen(Get.context!) ? null : 100),
      DataColumn2(label: Text('Date'),fixedWidth: TDeviceUtils.isMobileScreen(Get.context!) ? null : 200),
      DataColumn2(label: Text('Action'),fixedWidth: TDeviceUtils.isMobileScreen(Get.context!) ? null : 150),

    ], source: BrandRows());
  }
}
