import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/repostries/user/user_repository.dart';
import 'package:store/features/personalization/controllers/user_controller.dart';
import 'package:store/features/personalization/screens/profile/profile_screen.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/helpers/network_manager.dart';
import 'package:store/utils/popups/full_screen_loader.dart';
import 'package:store/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

//  Init uaer data whwn Home Screen appers
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

//  Init uaer data
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your information...', TImages.docerAnimation);
      // Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validatio
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Update user first & last name
      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Stop Loader
      TFullScreenLoader.stopLoading();

      // Show success Message
      TLoaders.succcessSnackBar(
          title: 'Congratultion', message: 'Your Name has been updated.');


     // Move to Previous Screen
      Get.off(const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap..!', message: e.toString());
    }
  }
}
