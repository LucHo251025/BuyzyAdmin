import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/styles/spacing_styles.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/login/widgets/login_form.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/login/widgets/login_header.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/text_strings.dart';

class LoginDesktopTablet extends StatelessWidget {
  const LoginDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Container(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                color: TColors.white),
            child: Column(
              children: [
                TLoginHeader(),
                TLoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


