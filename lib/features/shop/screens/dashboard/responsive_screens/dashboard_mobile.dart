import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/table/data_table.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/order_status_graph.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/weekly_sales.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              TDashboardCard(
                title: "Sales total",
                subTitle: '\$234.45',
                stats: 23,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TDashboardCard(
                title: "Sales total",
                subTitle: '\$234.45',
                stats: 213,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TDashboardCard(
                title: "Sales total",
                subTitle: '\$234.45',
                stats: 23,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TDashboardCard(
                title: "Sales total",
                subTitle: '\$234.45',
                stats: 213,
              ),

              SizedBox(
                height: TSizes.spaceBtwSections,
              ),


              // Bar  Graph
              TWeeklySalesGraph(),
              SizedBox(height: TSizes.spaceBtwSections,),

              TRoundedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recent Orders',style: Theme.of(context).textTheme.headlineSmall,),
                    SizedBox(height: TSizes.spaceBtwSections,),
                    DashboardOrderTable()
                  ],
                ),
              ),

              SizedBox(height: TSizes.spaceBtwSections,),


            ],
          ),
                ),
              ),
        )
    );
  }
}
