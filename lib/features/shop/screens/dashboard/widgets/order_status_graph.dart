import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/circular_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/dashbroad/dashboard_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/helper_functions.dart';

class OrderStatusGraph extends StatelessWidget {
  const OrderStatusGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DashBoardController.instance;
    return TRoundedContainer(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text('Orders Status',style: Theme.of(context).textTheme.headlineSmall,),
          SizedBox(height: TSizes.spaceBtwSections,),
          
          SizedBox(
            height: 400,
            child: PieChart(
              PieChartData(
                sections: controller.orderStatusData.entries.map((entry) {
                  final status = entry.key;
                  final count = entry.value;

                  return PieChartSectionData(
                    title: count.toString(),
                    value: count.toDouble(),
                    color: THelperFunctions.getOrderStatusColor(status),
                    radius: 100,
                    titleStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)
                  );
                }).toList(),
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse){

                  },
                  enabled: true
                )
              )
            ),
          ),
          
          
          SizedBox(
            width: double.infinity,
            child: DataTable(columns: [
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Order')),
              DataColumn(label: Text('Total')),

            ], rows: controller.orderStatusData.entries.map((entry){
              final OrderStatus status= entry.key;
              final int count = entry.value;
              final totalAccount = controller.totalAmounts[status] ?? 0;

              return DataRow(cells: [
                DataCell(
                  Row(children: [
                    TCircularContainer(width: 20,height: 20,backgroundColor: THelperFunctions.getOrderStatusColor(status),),
                    Expanded(child: Text('${controller.getDisplayStatusName(status)}'))
                  ],)
                ),
                DataCell(Text(count.toString())),
                DataCell(Text('\$${totalAccount.toStringAsFixed(2)}')),
              ]);
            }).toList(),
            ),
          )
      
        ],
      ),
    );
  }
}
