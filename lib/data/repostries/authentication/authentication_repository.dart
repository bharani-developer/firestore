import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store/features/authentication/screens/Onboarding/onboarding_screen.dart';
import 'package:store/features/authentication/screens/signin/login_screen.dart';
import 'package:store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:store/utils/exceptions/firebase_exceptions.dart';
import 'package:store/utils/exceptions/format_exceptions.dart';
import 'package:store/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
// -- Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

// -- Called from main.dart on app launch
  @override
  void onReady() {
    // - Remove the native splash screen
    FlutterNativeSplash.remove();
    // -- Redirect to the appropriate screen
    screenRedirect();
  }

// -- Function to show Relevant screen
  screenRedirect() async {
    //Local Storage

    deviceStorage.writeIfNull('IsFirstTime', true);
    // Check it its the first time
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }

/* -------------------Email & Password sign-in----------------------*/
// -- Email Authentication - Signin

// -- Email Authentiaction - Register

  Future<UserCredential> resgisterWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong Please try again ';
    }
  }

// --- ReAuthenticate - user

// -- Email Verification - Mail Verification

// --- Email Authentication - Forget Password

/* -------------------Federated identify & Social sign-in----------------------*/

// Google Authentication - Google
// Faceboook Authentication - Facebook

/* ------------------- Remove ----------------------*/

// Delete User - Remove User Auth and FireStore Account
// Logout User -- Valid for any any Authentication
}
