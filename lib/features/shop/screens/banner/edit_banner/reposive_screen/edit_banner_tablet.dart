import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadscrumbs/breadscrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/banner_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/edit_banner/widgets/edit_banner_form.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class EditBannerTablet extends StatelessWidget {
  const EditBannerTablet({super.key, required this.banner});


  final BannerModel banner;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBreadcrumbsWithHeading(heading: 'Update Banner', breadcrumbItems: [TRoutes.banners,'Create Banner']),
              SizedBox(height: TSizes.spaceBtwSections,),


              EditBannerForm(banner: banner),
            ],
          ),),
      ),
    );
  }
}
