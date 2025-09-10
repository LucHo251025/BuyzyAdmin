
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/firebase_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/format_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/platform_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/utils/formatters/formatter.dart';

class AuthenticationRepository extends GetxController {

  static AuthenticationRepository get instance => Get.find();

  // Firebase auth Instance
  final _auth =FirebaseAuth.instance;

  // Get Authentication Use Data
  User? get authUser => _auth.currentUser;

  //Get IsAuthenticated User
  bool get isAuthenticated => authUser != null;

  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
  }

  void screenRedirect() async {
    final user = _auth.currentUser;

    if(user != null) {
      Get.offAllNamed(TRoutes.dashboard);
    }else {
      Get.offAllNamed(TRoutes.login);
    }
  }

  //LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException  catch (e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch(e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  //REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException  catch (e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch(e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(TRoutes.login);
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException  catch (e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch(e) {
      throw 'Something went wrong. Please try again later.';
    }
  }
}