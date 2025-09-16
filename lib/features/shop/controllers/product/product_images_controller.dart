import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/features/media/controller/media_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/media/models/image_model.dart';

class ProductImagesController extends GetxController {
  static ProductImagesController get instance => Get.find();


  Rx<String?> selectedThumbnailUrl = Rx<String?>(null);

  final RxList<String> additionalProductImageUrls = <String>[].obs;


  void selectThumbnailImages() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFormMedia();


    if(selectedImages != null && selectedImages.isNotEmpty) {
      ImageModel selectedImage = selectedImages.first;

      selectedThumbnailUrl.value =selectedImage.url;
    }
  }

  void selectMultipleProductImages() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFormMedia(
      multipleSelection: true
    );

    if(selectedImages != null && selectedImages.isNotEmpty) {
      additionalProductImageUrls.assignAll(selectedImages.map((e) => e.url));
    }
  }

  Future<void> removeImages(int index) async {
    additionalProductImageUrls.removeAt(index);
  }
}