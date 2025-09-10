import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/responsive_screens/dashboard_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/responsive_screens/dashboard_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/responsive_screens/dashboard_tablet.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(userLayout: true,desktop: DashboardDesktop(),tablet: DashboardTablet(),mobile:DashboardMobile(),);
  }
}
