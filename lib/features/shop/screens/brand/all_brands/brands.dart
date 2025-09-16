import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/all_brands/reponsive_screens/brand_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/all_brands/reponsive_screens/brand_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/all_brands/reponsive_screens/brand_tablet.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: BrandDesktop(),
      tablet: BrandTablet(),
      mobile: BrandMobile(),
    );
  }
}
