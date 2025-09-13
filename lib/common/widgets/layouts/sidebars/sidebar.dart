import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_circular_image.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class TSideBar extends StatelessWidget {
  const TSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: TColors.white,
          border: Border(
            right: BorderSide(
              color: TColors.grey,
              width: 1,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TCircularImage(
                width: 100,
                height: 100,
                image: TImages.darkAppLogo,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Padding(
                padding: EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("MENU",style: Theme.of(context).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2),),

                    TMenuItem(route: TRoutes.login,icon: Iconsax.status,itemName: 'Dashboard',),
                    TMenuItem(route: TRoutes.media,icon: Iconsax.image,itemName: 'Media   ',),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


