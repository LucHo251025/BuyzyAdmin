import 'package:data_table_2/data_table_2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/dashbroad/dashboard_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/product/product_images_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/table/data_table.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/order_status_graph.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/weekly_sales.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';

class DashboardDesktop extends StatelessWidget {
  const DashboardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductImagesController());

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dashboard',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineLarge,
                ),
                ElevatedButton(onPressed: () => controller.selectThumbnailImages(), child: Text('Select Single Image')),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                ElevatedButton(onPressed: () => controller.selectMultipleProductImages(), child: Text('Select Multiple Single Image')),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TDashboardCard(
                          title: "Sales total",
                          subTitle: '\$234.45',
                          stats: 23,
                        )),
                    SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    Expanded(
                        child: TDashboardCard(
                          title: "Sales total",
                          subTitle: '\$234.45',
                          stats: 213,
                        )),
                    SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    Expanded(
                        child: TDashboardCard(
                          title: "Sales total",
                          subTitle: '\$234.45',
                          stats: 23,
                        )),
                  ],
                ),

                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                //Graphs
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          // Bar Grand
                          TWeeklySalesGraph(),
                          SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),
                          // Order
                          TRoundedContainer(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Recent Orders',style: Theme.of(context).textTheme.headlineSmall,),
                                SizedBox(height: TSizes.spaceBtwSections,),
                                DashboardOrderTable()
                              ],
                            ),
                          )
                        ],
                      ),

                    ),
                    SizedBox(
                      width: TSizes.spaceBtwSections,
                    ),
                    Expanded(
                      flex: 1,
                      child: OrderStatusGraph(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

}
