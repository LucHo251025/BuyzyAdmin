import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:yt_ecommerce_admin_panel/app.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/forget_password/forget_password.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/login/login.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/reset_password/reset_password.dart';
import 'package:yt_ecommerce_admin_panel/features/media/screens/media/media.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/all_banner/banners.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/create_banner/create_banner.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/edit_banner/edit_banner.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/all_brands/brands.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/create_brand/create_brand.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/edit_brand/edit_brand.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/all_categories/categories.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/create_category/create_category.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/edit_category/edit_category.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/dashboard.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/all_product/product.dart';
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
    GetPage(
      name: TRoutes.media,
      page: () => MediaScreen(),
      middlewares: [TRoutesMiddleware()],
    ),


    GetPage(
      name: TRoutes.categories,
      page: () => CategoriesScreen(),
      middlewares: [TRoutesMiddleware()],
    ),

    GetPage(
      name: TRoutes.createCategory,
      page: () => CreateCategoryScreen(),
      middlewares: [TRoutesMiddleware()],
    ),
    GetPage(
      name: TRoutes.editCategory,
      page: () => EditCategoryScreen(),
      middlewares: [TRoutesMiddleware()],
    ),


    GetPage(
      name: TRoutes.brands,
      page: () => BrandsScreen(),
      middlewares: [TRoutesMiddleware()],
    ),
    GetPage(
      name: TRoutes.createBrand,
      page: () => CreateBrandScreen(),
      middlewares: [TRoutesMiddleware()],
    ) ,
    GetPage(
      name: TRoutes.editBrand,
      page: () => EditBrandScreen(),
      middlewares: [TRoutesMiddleware()],
    ),

    GetPage(
      name: TRoutes.banners,
      page: () => BannersScreen(),
      middlewares: [TRoutesMiddleware()],
    ),

    GetPage(
      name: TRoutes.editBrand,
      page: () => CreateBannerScreen(),
      middlewares: [TRoutesMiddleware()],
    ),

    GetPage(
      name: TRoutes.editBrand,
      page: () => EditBannerScreen(),
      middlewares: [TRoutesMiddleware()],
    ),





    GetPage(
      name: TRoutes.products,
      page: () => ProductScreen(),
      middlewares: [TRoutesMiddleware()],
    ) ,
    GetPage(
      name: TRoutes.createProduct,
      page: () => CreateBrandScreen(),
      middlewares: [TRoutesMiddleware()],
    ) ,
    GetPage(
      name: TRoutes.editProduct,
      page: () => EditBrandScreen(),
      middlewares: [TRoutesMiddleware()],
    ) ,

  ];
}
