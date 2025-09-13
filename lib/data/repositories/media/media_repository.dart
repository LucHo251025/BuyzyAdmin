import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/data/repositories/cloudinary_service.dart';
import 'package:yt_ecommerce_admin_panel/features/media/models/image_model.dart';

class MediaRepository extends GetxController {
  static MediaRepository get instance => Get.find();

  final CloudinaryService _cloudinaryService = CloudinaryService();

  /// Upload image (Cloudinary) từ File (mobile)
  Future<ImageModel> uploadImageFileInStorage({
    required File file,
    required String path,
    required String imageName,
  }) async {
    try {
      final data = await _cloudinaryService.uploadImage(file);
      return ImageModel.fromCloudinary(data, path, imageName);
    } catch (e) {
      throw e.toString();
    }
  }

  /// Upload image (Cloudinary) từ bytes (web)
  Future<ImageModel> uploadImageBytesInStorage({
    required Uint8List bytes,
    required String path,
    required String imageName,
  }) async {
    try {
      final data = await _cloudinaryService.uploadImageBytes(bytes, imageName);
      return ImageModel.fromCloudinary(data, path, imageName);
    } catch (e) {
      throw e.toString();
    }
  }

  /// Lưu metadata vào Firestore
  Future<String> uploadImageFileInDatabase(ImageModel image) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection("Images")
          .add(image.toJson());
      return data.id;
    } catch (e) {
      throw e.toString();
    }
  }
}
