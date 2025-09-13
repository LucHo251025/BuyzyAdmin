import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart' as html;
import 'package:yt_ecommerce_admin_panel/data/repositories/media/media_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/media/models/image_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/dialogs.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/loaders.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneViewController;
  final RxBool showImagesUploaderSection = false.obs;
  final Rx<MediaCategory> selectedPath = MediaCategory.folders.obs;
  final RxList<ImageModel> selectedImagesToUpload = <ImageModel>[].obs;

  final RxList<ImageModel> allImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBannerImages = <ImageModel>[].obs;
  final RxList<ImageModel> allCategoryImages = <ImageModel>[].obs;
  final RxList<ImageModel> allProductImages = <ImageModel>[].obs;
  final RxList<ImageModel> allUserImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBrandImages = <ImageModel>[].obs;

  final MediaRepository mediaRepository = MediaRepository();
  Future<void> selectLocalImages() async {
    final files = await dropzoneViewController.pickFiles(
      multiple: true,
      mime: ['image/jpeg', 'image/png'],
    );

    if (files.isNotEmpty) {
      for (final file in files) {
        final bytes = await dropzoneViewController.getFileData(file);
        final image = ImageModel(
          url: '',
          file: file,
          localImageToDisplay: Uint8List.fromList(bytes),
          filename: file.name,
          mediaCategory: selectedPath.value.name,
        );
        selectedImagesToUpload.add(image);
      }
    }
  }

  void uploadImagesConfirmation() {
    if (selectedPath.value == MediaCategory.folders) {
      TLoaders.warningSnackBar(
          title: 'Select Folder',
          message: 'Please select the Folder in Order to upload Images');
      return;
    }

    TDialogs.defaultDialog(
        context: Get.context!,
        title: "Upload Images",
        confirmText: "Upload",
        onConfirm: () async => await uploadImages(),
        content:
            "Are you sure you want to upload all the Images in ${selectedPath.value.name} folder?");
  }

  Future<void> uploadImages() async {
    try {
      Get.back();

      uploadImagesLoader();

      MediaCategory selectedCategory = selectedPath.value;

      RxList<ImageModel> targetList;

      switch (selectedCategory) {
        case MediaCategory.banners:
          targetList = allBannerImages;
          break;
        case MediaCategory.brands:
          targetList = allBrandImages;
          break;
        case MediaCategory.categories:
          targetList = allCategoryImages;
          break;
        case MediaCategory.products:
          targetList = allProductImages;
          break;
        case MediaCategory.users:
          targetList = allUserImages;
          break;
        default:
          return;
      }


      for(int i = selectedImagesToUpload.length -1; i>=0;i--) {
        var selectedImage = selectedImagesToUpload[i];

        final ImageModel uploadedImage = await mediaRepository.uploadImageBytesInStorage(
          bytes: selectedImage.localImageToDisplay!,
          path: getSelectedPath(),
          imageName: selectedImage.filename,
        );

        uploadedImage.mediaCategory = selectedCategory.name;
        final id = await mediaRepository.uploadImageFileInDatabase(uploadedImage);

        uploadedImage.id =id;

        selectedImagesToUpload.removeAt(i);
        targetList.add(uploadedImage);
      }

      TFullScreenLoader.stopLoading();
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.warningSnackBar(
          title: 'Error Uploading Image',
          message: 'Something went wrong while uploading your images');
    }
  }
  String getSelectedPath() {
    switch (selectedPath.value) {
      case MediaCategory.banners:
        return TTexts.bannersStoragePath;
      case MediaCategory.brands:
        return TTexts.brandsStoragePath;
      case MediaCategory.categories:
        return TTexts.categoriesStoragePath;
      case MediaCategory.products:
        return TTexts.productsStoragePath;
      case MediaCategory.users:
        return TTexts.usersStoragePath;
      default:
        return 'others';
    }
  }

  void uploadImagesLoader() {
    showDialog(
        context: Get.context!,
        builder: (context) => PopScope(
            canPop: false,
            child: AlertDialog(
              title: Text('Uploading Images'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    TImages.uploadingImageIllustration,
                    height: 300,
                    width: 300,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Text('Sit Tight! We are uploading your images'),
                ],
              ),
            )
          )
    );
  }

}
