import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/create_brand/reposive_screens/create_brand_tablet.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/reposive_screen/create_product_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/reposive_screen/create_product_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/reposive_screen/create_product_tablet.dart';

class CreateProductScreens extends StatelessWidget {
  const CreateProductScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: CreateProductDesktop(),
      tablet: CreateProductTablet(),
      mobile: CreateProductMobile(),
    );
  }
}
