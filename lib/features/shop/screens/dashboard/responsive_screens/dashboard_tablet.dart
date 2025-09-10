import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class DashboardTablet extends StatelessWidget {
  const DashboardTablet({super.key});

  @override
  Widget build(BuildContext context) {
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
                  ],
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
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
                  ],
                ),

              ],
            ),
          ),
        )
    );
  }
}
