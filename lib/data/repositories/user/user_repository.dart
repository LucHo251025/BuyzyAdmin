import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/models/user_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/format_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{

  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }on FormatException catch (_) {
      throw TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }


  Future<UserModel> fectAdminDetails() async {
    try {
      final docSnapsnot = await _db.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).get();
      return UserModel.fromSnapshot(docSnapsnot);

    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }on FormatException catch (_) {
      throw TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }
}