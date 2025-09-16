import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/create_banner/reposive_screen/create_banner_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/edit_banner/reposive_screen/edit_banner_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/edit_banner/reposive_screen/edit_banner_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/edit_banner/reposive_screen/edit_banner_tablet.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/create_brand/reposive_screens/create_brand_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/create_brand/reposive_screens/create_brand_tablet.dart';

class EditBannerScreen extends StatelessWidget {
  const EditBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final banner = Get.arguments;
    return TSiteTemplate(
      desktop: EditBannerDesktop(banner: banner,),
      tablet: EditBannerTablet(banner: banner,),
      mobile: EditBannerMobile(banner: banner,),
    );
  }
}
