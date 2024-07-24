import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:store/common/styles/spacing_styles.dart';
import 'package:store/common/widgets/login_signup/form_divider.dart';
import 'package:store/common/widgets/login_signup/social_buttons.dart';
import 'package:store/features/authentication/screens/signin/widgets/login_form.dart';
import 'package:store/features/authentication/screens/signin/widgets/login_header.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                children: [
                  const TLoginHeader(),
                   TLoginForm(),
                  TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSocialButtons()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
