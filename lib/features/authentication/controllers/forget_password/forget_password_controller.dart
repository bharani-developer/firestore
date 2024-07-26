import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:store/data/repostries/authentication/authentication_repository.dart';
import 'package:store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/helpers/network_manager.dart';
import 'package:store/utils/popups/full_screen_loader.dart';
import 'package:store/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();
  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing Your request...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      //  Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Succeess Screen
      TLoaders.succcessSnackBar(
          title: 'Email Sent', message: 'Email link set to reset password'.tr);

      // Redirect
      Get.to(
        () => ResetPasswordScreen(
          email: email.text.trim(),
        ),
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap..!', message: e.toString());
    }
  }

  //reSend Reset Password Email
  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing Your request...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      //  Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Succeess Screen
      TLoaders.succcessSnackBar(
          title: 'Email Sent', message: 'Email link set to reset password'.tr);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap..!', message: e.toString());
    }
  }
}
