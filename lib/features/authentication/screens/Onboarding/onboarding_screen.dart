import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:store/features/authentication/screens/Onboarding/widgets/onboading_dot_navigation_dot.dart';
import 'package:store/features/authentication/screens/Onboarding/widgets/onboarding_next_button.dart';
import 'package:store/features/authentication/screens/Onboarding/widgets/onboarding_pages.dart';
import 'package:store/features/authentication/screens/Onboarding/widgets/onboarding_skip.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          OnBoardingPages(controller: controller),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
