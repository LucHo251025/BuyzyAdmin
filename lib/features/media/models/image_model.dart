import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart';
import 'package:yt_ecommerce_admin_panel/utils/formatters/formatter.dart';

class ImageModel {
   String? id;
  final String url;
  final String? folder;
  final int? sizeBytes;
  String mediaCategory;
  final String filename;
  final String? fullPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? contentType;


  final DropzoneFileInterface? file;
  final Uint8List? localImageToDisplay;
  RxBool isSelected = false.obs;

  ImageModel({
    this.id,
    required this.url,
    this.folder,
    this.sizeBytes,
    this.mediaCategory ='',
    required this.filename,
    this.fullPath,
    this.createdAt,
    this.updatedAt,
    this.contentType,
    this.file,
    this.localImageToDisplay,
  });

  static ImageModel empty() => ImageModel(
    id: '',
    url: '',
    filename: ''

  );

  String get createdAtFormatted => TFormatter.formatDate(createdAt);
  String get updatedAtFormatted => TFormatter.formatDate(updatedAt);

  Map<String,dynamic> toJson() {
    return {
      'url': url,
      'folder': folder,
      'sizeBytes': sizeBytes,
      'mediaCategory': mediaCategory,
      'filename': filename,
      'fullPath': fullPath,
      'createdAt': FieldValue
          .serverTimestamp(),
      'contentType': contentType,
    };
  }

  factory ImageModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return ImageModel(
        id: document.id,
        url: data['url'] ?? '',
        folder: data['folder'] ?? '',
        sizeBytes: data['sizeBytes'] ?? 0,
        filename: data['filename'] ?? '',
        fullPath: data['fullPath'] ?? '',
        createdAt: data.containsKey('createdAt') ? data['createdAt']?.toDate() : null,
        updatedAt: data.containsKey('updatedAt') ? data['updatedAt']?.toDate() : null,
        contentType: data['contentType'] ?? '',
        mediaCategory: data['mediaCategory'] ?? '',

      );
    }else {
      return ImageModel.empty();
    }
  }

  factory ImageModel.fromCloudinary(
      Map<String, dynamic> data, String folder, String fileName) {
    return ImageModel(
      id: data['asset_id'],                // tương tự document id
      url: data['secure_url'] ?? '',
      folder: folder,
      sizeBytes: data['bytes'],
      filename: fileName,
      fullPath: data['public_id'],
      createdAt: DateTime.tryParse(data['created_at'] ?? ''), // ✅ Cloudinary date string
      updatedAt: DateTime.tryParse(data['created_at'] ?? ''), // Cloudinary không có updatedAt, mình dùng createdAt
      contentType: data['format'],         // jpg, png,...
      mediaCategory: folder,
    );
  }

}
