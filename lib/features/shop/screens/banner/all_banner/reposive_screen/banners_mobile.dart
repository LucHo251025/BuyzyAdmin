import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadscrumbs/breadscrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/data_table/table_header.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/all_banner/table/data_table.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
class BannersMobile extends StatelessWidget {
  const BannersMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBreadcrumbsWithHeading(heading: "Banners", breadcrumbItems: ['Banners']),
                  SizedBox(height: TSizes.spaceBtwSections,),

                  TRoundedContainer(
                    child: Column(
                      children: [
                        TTableHeader(buttonText: 'Create New Banner',onPressed: () => Get.toNamed(TRoutes.createBrand),),
                        SizedBox(height: TSizes.spaceBtwItems,),

                        BannerTable()

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
