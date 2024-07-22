import 'package:flutter/material.dart';

import 'package:store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:store/features/authentication/screens/Onboarding/widgets/onboarding_page.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/text_strings.dart';

class OnBoardingPages extends StatelessWidget {
  const OnBoardingPages({
    super.key,
    required this.controller,
  });

  final OnBoardingController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller.pageController,
      onPageChanged: controller.updatePageIndicator,
      children: const [
        OnBoardingPage(
          image: TImages.onBoardingImage1,
          title: TTexts.onBoardingTitle1,
          subtitle: TTexts.onBoardingSubTitle1,
        ),
        OnBoardingPage(
          image: TImages.onBoardingImage2,
          title: TTexts.onBoardingTitle2,
          subtitle: TTexts.onBoardingSubTitle2,
        ),
        OnBoardingPage(
          image: TImages.onBoardingImage3,
          title: TTexts.onBoardingTitle3,
          subtitle: TTexts.onBoardingSubTitle3,
        ),
      ],
    );
  }
}
