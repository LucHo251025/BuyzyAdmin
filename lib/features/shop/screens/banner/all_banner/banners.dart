import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/all_banner/reposive_screen/banners_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/all_banner/reposive_screen/banners_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/all_banner/reposive_screen/banners_tablet.dart';

class BannersScreen extends StatelessWidget {
  const BannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: BannersDesktop(),
      tablet: BannersTablet(),
      mobile: BannersMobile(),
    );
  }
}
