import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/reposive_screen/edit_product_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/reposive_screen/edit_product_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/reposive_screen/edit_product_tablet.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(desktop: EditProductDesktop(),
    tablet: EditProductTablet(),
    mobile: EditProductMobile(),);
  }
}
