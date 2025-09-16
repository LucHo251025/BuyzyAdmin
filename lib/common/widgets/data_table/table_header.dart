import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';

class TTableHeader extends StatelessWidget {
  const TTableHeader(
      {super.key,
      this.onPressed,
      required this.buttonText,
      this.searchController,
      this.searchOnChanged});

  final Function()? onPressed;
  final String buttonText;

  final TextEditingController? searchController;
  final Function(String)? searchOnChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: !TDeviceUtils.isDesktopScreen(context) ? 1 : 3,
            child: Row(
              children: [
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () => Get.toNamed(TRoutes.createCategory),
                      child: Text(buttonText)),
                ),
              ],
            )),
        Expanded(
          flex: !TDeviceUtils.isDesktopScreen(context) ? 2 : 1,
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
                hintText: "Search Categories",
                prefixIcon: Icon(Iconsax.search_normal)),
          ),
        )
      ],
    );
  }
}
