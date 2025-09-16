import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/create_banner/reposive_screen/create_banner_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/create_banner/reposive_screen/create_banner_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/create_banner/reposive_screen/create_banner_tablet.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/create_brand/reposive_screens/create_brand_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/create_brand/reposive_screens/create_brand_tablet.dart';

class CreateBannerScreen extends StatelessWidget {
  const CreateBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: CreateBannerDesktop(),
      tablet: CreateBannerTablet(),
      mobile: CreateBannerMobile(),
    );
  }
}
