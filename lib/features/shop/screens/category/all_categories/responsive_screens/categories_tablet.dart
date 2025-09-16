import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadscrumbs/breadscrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/data_table/table_header.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/all_categories/tablet/data_table.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
class CategoriesTablet extends StatelessWidget {
  const CategoriesTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TRoundedContainer(
                child: Column(
                  children: [
                    TTableHeader(buttonText: "Create New Category",onPressed: () => Get.toNamed(TRoutes.createCategory),  ),
                    SizedBox(height: TSizes.spaceBtwSections,),

                    CategoryTable()
                  ],
                ),
              )

            ],
          ),),
      ),
    );
  }
}
