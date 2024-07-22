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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();

  final phoneNumberController = TextEditingController();

  void signup() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
          'We are Processing your information...', TImages.applePay);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Check if form is valid
      if (!signupFormKey.currentState!.validate()) {
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
          .resgisterWithEmailAndPassword(
              emailController.text.trim(), passwordController.text.trim());
      //  Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        username: userNameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      //  Show Success Message
      TLoaders.succcessSnackBar(
          title: 'Congradulation',
          message: 'Your account has been created! Verify email to continue');
      Get.to(()=>const VerifyEmailScreen());
    } catch (e) {
      // Show generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap..!', message: e.toString());
    } finally {
      // Remove Loader
      TFullScreenLoader.stopLoading();
    }
  }
}
