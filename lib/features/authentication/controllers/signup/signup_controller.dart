// lib/controllers/signup_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/repostries/authentication/authentication_repository.dart';
import 'package:store/data/repostries/user/user_repository.dart';
import 'package:store/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:store/features/personalization/models/user_model.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/helpers/network_manager.dart';
import 'package:store/utils/popups/full_screen_loader.dart';
import 'package:store/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();

  final phoneNumber = TextEditingController();

  void signup() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
          'We are Processing your information...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
      }

      // Check if form is valid
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to crete account,you must have to read and accept the privacy policy & Terms of use');
        return;
      }
      // Register user in the Firebase Authenication & save data in to Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      //  Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      //  Show Success Message
      TLoaders.succcessSnackBar(
          title: 'Congradulation',
          message: 'Your account has been created! Verify email to continue');
      Get.to(
        () => VerifyEmailScreen(
          email: email.text.trim(),
        ),
      );
    } catch (e) {
      // Show generic error to the user
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap..!', message: e.toString());
    }
  }
}
