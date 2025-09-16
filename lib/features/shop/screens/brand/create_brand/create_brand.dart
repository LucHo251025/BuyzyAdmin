import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/create_brand/reposive_screens/create_brand_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/create_brand/reposive_screens/create_brand_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/create_brand/reposive_screens/create_brand_tablet.dart';

class CreateBrandScreen extends StatelessWidget {
  const CreateBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final banner = Get.arguments;
    return TSiteTemplate(
      desktop: CreateBrandDesktop(),
      tablet: CreateBrandTablet(),
      mobile: CreateBrandMobile(),
    );
  }
}
