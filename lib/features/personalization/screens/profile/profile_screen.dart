import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/common/widgets/images/circular_image.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/personalization/controllers/user_controller.dart';
import 'package:store/features/personalization/screens/profile/widgets/change_name_screen.dart';
import 'package:store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:store/features/shop/screens/home/home_screen.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () => Get.to(() => const HomeScreen()),
                      child: const Text('Change Profile Picture'),
                    ),
                    // Details
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    const TSectionHeading(
                      title: 'Profile Information',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TProfileMenu(
                      title: 'Name',
                      value: controller.user.value.fullName,
                      onPressed: () => Get.to(const ChangeName()),
                    ),
                    TProfileMenu(
                      title: 'Username',
                      value: controller.user.value.username,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    const TSectionHeading(
                      title: 'Personal Information',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TProfileMenu(
                      title: 'User ID',
                      value: controller.user.value.id,
                      icon: Iconsax.copy,
                      onPressed: () {},
                    ),
                    TProfileMenu(
                      title: 'E-mail',
                      value: controller.user.value.email,
                      onPressed: () {},
                    ),
                    TProfileMenu(
                      title: 'Phone Number',
                      value: controller.user.value.phoneNumber,
                      onPressed: () {},
                    ),
                    TProfileMenu(
                      title: 'Gender',
                      value: 'Male',
                      onPressed: () {},
                    ),
                    TProfileMenu(
                      title: 'Date of Birth',
                      value: '11 Jan 1995',
                      onPressed: () {},
                    ),
                    const Divider(),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () => controller.deleteAccountWarningPopup(),
                        child: const Text(
                          'Close Account',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
