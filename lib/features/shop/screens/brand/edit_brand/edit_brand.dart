import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/edit_brand/reposive_screens/edit_brand_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/edit_brand/reposive_screens/edit_brand_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/edit_brand/reposive_screens/edit_brand_tablet.dart';

class EditBrandScreen extends StatelessWidget {
  const EditBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final banner =Get.arguments;
    return TSiteTemplate(
      desktop: EditBrandDesktop(),
      tablet: EditBrandTablet(),
      mobile: EditBrandMobile(),
    );
  }
}
