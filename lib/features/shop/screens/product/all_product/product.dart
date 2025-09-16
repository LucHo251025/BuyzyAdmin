import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/all_product/reposive_screen/product_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/all_product/reposive_screen/product_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/all_product/reposive_screen/product_tablet.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: ProductDesktop(),
      tablet: ProductTablet(),
      mobile: ProductMobile(),
    );
  }
}
