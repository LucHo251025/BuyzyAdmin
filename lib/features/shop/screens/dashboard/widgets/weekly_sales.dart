import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/dashbroad/dashboard_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';

class TWeeklySalesGraph extends StatelessWidget {
  const TWeeklySalesGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashBoardController());
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Sales',
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium,
          ),
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
            height: 400,
            child: BarChart(BarChartData(
                titlesData: buildFlTitlesData(),
                borderData: FlBorderData(
                    show: false,
                    border: Border(
                        top: BorderSide.none,
                        right: BorderSide.none)),
                gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                    horizontalInterval: 200),
                barGroups: controller.weeklySales
                    .asMap()
                    .entries
                    .map(
                        (entry) =>
                        BarChartGroupData(
                            x: entry.key,
                            barRods: [
                              BarChartRodData(
                                  toY: entry.value,
                                  color: TColors.primary,
                                  width: 30,
                                  borderRadius: BorderRadius
                                      .circular(
                                      TSizes.sm))
                            ]))
                    .toList(),
                groupsSpace: TSizes.spaceBtwItems,
                barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (_) =>
                        TColors.secondary
                    ),
                    touchCallback: TDeviceUtils
                        .isDesktopScreen(context)
                        ? (barToolEvent,
                        barTouchResponse) {}
                        : null
                )
            )
            ),
          )
        ],
      ),
    );
  }
  FlTitlesData buildFlTitlesData() {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
            final index = value.toInt() % days.length;
            return Text(days[index], style: const TextStyle(fontSize: 12));
          },
          reservedSize: 30,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 100,
          reservedSize: 40,
        ),
      ),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

}

