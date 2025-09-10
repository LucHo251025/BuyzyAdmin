import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/reponsive/reponsive_design.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/reponsive/screens/desktop_layout.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/reponsive/screens/mobile_layout.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/reponsive/screens/tablet_layout.dart';

class TSiteTemplate extends StatelessWidget {
  const TSiteTemplate({super.key, this.desktop,  this.tablet,  this.mobile,  this.userLayout = true});

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;

  final bool userLayout;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: TReponsiveWidget(
          desktop: userLayout ? DesktopLayout(body: desktop,) : desktop ?? Container(),
          tablet: userLayout ?TabletLayout(body: tablet ?? desktop,): tablet ?? desktop ?? Container(),
          mobile: userLayout ? MobileLayout(body: mobile ?? desktop,): mobile ?? desktop ?? Container(),
      ),
    );
  }
}
