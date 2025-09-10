import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';

class RouteObservers extends GetObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if(previousRoute != null) {

      for(var routeName in TRoutes.sidebarMenuItems) {
        if(previousRoute.settings.name == routeName) {
          sidebarController.activeItem.value = routeName;
        }
      }
    }
  }
}