import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/icons/table_action_icon_buttons.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_model.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';

import '../../../../../../utils/constants/sizes.dart';



class ProductsRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(
        cells: [
          DataCell(
              Row(
                children: [
                  TRoundedImage(
                    width: 50,
                    height: 50,
                    padding: TSizes.xs,
                    imageType: ImageType.asset,
                    image: TImages.banner1,
                    borderRadius: TSizes.borderRadiusMd,
                    backgroundColor: TColors.primaryBackground,
                  ),
                  SizedBox(width: TSizes.spaceBtwItems,),
                  Flexible(child: Text('Product Title', style: Theme
                      .of(Get.context!)
                      .textTheme
                      .bodyLarge!
                      .apply(color: TColors.primary),))
                ],
              )
          ),
          
          DataCell(Text('256')),
          DataCell(
              Row(
                children: [
                  TRoundedImage(
                    width: 35,
                    height: 35,
                    padding: TSizes.xs,
                    imageType: ImageType.asset,
                    image: TImages.nikeLogo,
                    borderRadius: TSizes.borderRadiusMd,
                    backgroundColor: TColors.primaryBackground,
                  ),
                  SizedBox(width: TSizes.spaceBtwItems,),
                  Flexible(child: Text('Nike', style: Theme
                      .of(Get.context!)
                      .textTheme
                      .bodyLarge!
                      .apply(color: TColors.primary),))
                ],
              )
          ),

          DataCell(Text('\$256')),

          DataCell(Text(DateTime.now().toString())),
          
          DataCell(
            TTableActionButtons(
              onEditPressed: () => Get.toNamed(TRoutes.editProduct,arguments: ProductModel.empty()),
              onDeletePressed: (){},
            )
          )

        ]
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => 100;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}