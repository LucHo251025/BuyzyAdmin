import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:yt_ecommerce_admin_panel/app.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/forget_password/forget_password.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/login/login.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/reset_password/reset_password.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/dashboard.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';

import 'routes_middleware.dart';

class TAppRoute {

  static final List<GetPage> pages = [
    GetPage(
      name: TRoutes.login,
      page: () => const LoginScreen(),
      // middlewares: [TRoutesMiddleware()],
    ),

    GetPage(
      name: TRoutes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
      // middlewares: [TRoutesMiddleware()],
    ),
    GetPage(
      name: TRoutes.resetPassword,
      page: () => const ResetPasswordScreen(),
      // middlewares: [TRoutesMiddleware()],
    ),
    GetPage(
      name: TRoutes.dashboard,
      page: () => const Dashboard(),
      middlewares: [TRoutesMiddleware()],
    ),
  ];
}