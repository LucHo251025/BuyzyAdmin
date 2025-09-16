import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/data_table/paginated_data_table.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/all_categories/tablet/data_source.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(columns: [
      DataColumn2(label: Text('Category')),
      DataColumn2(label: Text('Parent Category')),
      DataColumn2(label: Text('Featured')),
      DataColumn2(label: Text('Data')),
      DataColumn2(label: Text('Action'),fixedWidth: 120),


    ], source: CategoryRow());
  }
}
