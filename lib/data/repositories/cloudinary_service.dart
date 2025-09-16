import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class CloudinaryService {
  static const String cloudName = "dgia7xhhe"; // Cloudinary cloud name
  static const String uploadPreset = "upload-image";
  static const String apiKey = "398666398385224";
  static const String apiSecret = "cSv3dNHi7UjTk6KRC9jfWgwarvQ";

  /// Upload image từ File (cho mobile / desktop)
  Future<Map<String, dynamic>> uploadImage(File imageFile) async {
    final uri = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");

    final request = http.MultipartRequest('POST', uri)
      ..fields['upload_preset'] = uploadPreset
      ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    final response = await request.send();
    final resBody = await response.stream.bytesToString();
    final data = json.decode(resBody);

    if (response.statusCode == 200) {
      return data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to upload image: ${data['error']['message']}');
    }
  }

  /// Upload image từ Uint8List (cho web)
  Future<Map<String, dynamic>> uploadImageBytes(Uint8List bytes, String filename) async {
    final uri = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");

    final request = http.MultipartRequest('POST', uri)
      ..fields['upload_preset'] = uploadPreset
      ..files.add(http.MultipartFile.fromBytes('file', bytes, filename: filename));

    final response = await request.send();
    final resBody = await response.stream.bytesToString();
    final data = json.decode(resBody);

    if (response.statusCode == 200) {
      return data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to upload image: ${data['error']['message']}');
    }
  }
  Future<void> deleteImage(String publicId) async {
    final uri = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/resources/image/upload/$publicId");

    final auth = base64Encode(utf8.encode('$apiKey:$apiSecret'));

    final response = await http.delete(
      uri,
      headers: {
        "Authorization": "Basic $auth",
      },
    );

    if (response.statusCode != 200 && response.statusCode != 202) {
      throw Exception('Failed to delete image: ${response.body}');
    }
  }
}
