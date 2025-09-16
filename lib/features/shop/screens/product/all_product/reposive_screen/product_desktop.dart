import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadscrumbs/breadscrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/data_table/table_header.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/all_product/reposive_screen/product_tablet.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/all_product/table/data_table.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductDesktop extends StatelessWidget {
  const ProductDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBreadcrumbsWithHeading(heading: "Products", breadcrumbItems: ['Products']),
                  SizedBox(height: TSizes.spaceBtwSections,),

                  TRoundedContainer(
                    child: Column(
                      children: [
                        TTableHeader(buttonText: 'All Products',onPressed: () => Get.toNamed(TRoutes.createProduct),),
                        SizedBox(height: TSizes.spaceBtwItems,),

                          ProductsTable()

                      ],
                    ),
                  )
                ],
              )
            ],
          ),),
        )
    );
  }
}
