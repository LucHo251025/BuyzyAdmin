import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadscrumbs/breadscrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';

class CreateProductDesktop extends StatelessWidget {
  const CreateProductDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBreadcrumbsWithHeading(
                  heading: "Create Product",
                  breadcrumbItems: [TRoutes.products, 'Create Product']),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: TDeviceUtils.isTabletScreen(context) ? 2 : 3,
                      child: Column(
                    children: [
                      //Basic Information
                      SizedBox(height: TSizes.spaceBtwSections,),


                      TRoundedContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Text('Stock & Pricing',style: Theme.of(context).textTheme.headlineSmall,),
                            SizedBox(height: TSizes.spaceBtwSections,),

                            //Product Type
                            SizedBox(height: TSizes.spaceBtwSections,),

                            //Attributes
                            SizedBox(height: TSizes.spaceBtwSections,)

                          ],
                        ),
                      )
                    ],
                  )
                  ),

                  SizedBox(width: TSizes.defaultSpace,),

                  Expanded(child: Column(
                    children: [
                      // Product Thumbnail
                      SizedBox(height: TSizes.spaceBtwSections,),


                      //Product Images
                      TRoundedContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("All Product Image",style: Theme.of(context).textTheme.headlineSmall,),
                            SizedBox(height: TSizes.spaceBtwItems,),
                          ],
                        ),
                      ),

                      SizedBox(height: TSizes.spaceBtwSections,),

                      //Product Brand
                      SizedBox(height: TSizes.spaceBtwSections,),

                      //Product Visibility
                      SizedBox(height: TSizes.spaceBtwSections,)
                    ],
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
