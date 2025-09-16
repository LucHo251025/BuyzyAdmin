import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadscrumbs/breadscrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class CreateBrandDesktop extends StatelessWidget {
  const CreateBrandDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            TBreadcrumbsWithHeading(returnToPreviousScreen: true,heading: "Create Brand", breadcrumbItems: [TRoutes.categories,'Create Brand']),
            SizedBox(height: TSizes.spaceBtwItems,),

          ],
        ),),
      ),
    );
  }
}
