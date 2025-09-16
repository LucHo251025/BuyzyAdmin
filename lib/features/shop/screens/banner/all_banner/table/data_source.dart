import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/icons/table_action_icon_buttons.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/banner_model.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class BannersRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      DataCell(
        TRoundedImage(
          width: 180,
          height: 100,
          padding: TSizes.sm,
          imageType: ImageType.network,
          image: TImages.banner1,
          borderRadius: TSizes.borderRadiusMd,
          backgroundColor: TColors.primaryBackground,
        )
      ),
      DataCell(Text('Shop')),
      DataCell(Icon(Iconsax.eye,color: TColors.primary,)),
      DataCell(TTableActionButtons(
        onEditPressed: () => Get.toNamed(TRoutes.editBrand,arguments: BannerModel(imageUrl: '', targetScreen: '',active: true)),
        onDeletePressed: (){},
      ))
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate =>false;

  @override
  // TODO: implement rowCount
  int get rowCount => 10;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}