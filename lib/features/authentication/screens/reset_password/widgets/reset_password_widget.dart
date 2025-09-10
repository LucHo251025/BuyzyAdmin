import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/text_strings.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({
    super.key,
     this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //Header
        Row(
          children: [
            IconButton(onPressed: () => Get.offAllNamed(TRoutes.login),
                icon: Icon(CupertinoIcons.clear)),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems,),

        //Image
        Image(
          image: AssetImage(TImages.deliveredEmailIllustration),
          width: 300,
          height: 300,),
        SizedBox(height: TSizes.spaceBtwItems,),

        //Title & Subtitle
        Text(TTexts.changeYourPasswordTitle, style: Theme
            .of(context)
            .textTheme
            .headlineMedium, textAlign: TextAlign.center,),
        SizedBox(height: TSizes.spaceBtwItems,),
        Text(email ?? '', textAlign: TextAlign.center, style: Theme
            .of(context)
            .textTheme
            .labelLarge,),
        SizedBox(height: TSizes.spaceBtwItems,),
        Text(
          TTexts.changeYourPasswordSubTitle,
          textAlign: TextAlign.center,
          style: Theme
              .of(context)
              .textTheme
              .labelMedium,
        ),
        SizedBox(height: TSizes.spaceBtwSections),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () => Get.offAllNamed(TRoutes.login),
              child: Text(TTexts.done)),
        ),
        SizedBox(height: TSizes.spaceBtwItems,),

        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: () {}, child: Text(TTexts.resendEmail)),
        )
      ],
    );
  }
}
