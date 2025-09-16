import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadscrumbs/breadscrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/create_banner/widgets/create_banner_form.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class CreateBannerDesktop extends StatelessWidget {
  const CreateBannerDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBreadcrumbsWithHeading(heading: 'Create Banner', breadcrumbItems: [TRoutes.banners,'Create Banner']),
              SizedBox(height: TSizes.spaceBtwSections,),


              CreateBannerForm(),
            ],
          ),),
      ),
    );
  }
}

