import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/features/personalization/controllers/update_name_controller.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          Text(
            'Use realname for easy Verfication. This name will appear on several pages',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Form(
            key: controller.updateUserNameFormKey,
            child: Column(children: [
              TextFormField(
                controller: controller.firstName,
                validator: (value) =>
                    TValidator.validateEmptyText('Frst Name', value),
                expands: false,
                decoration: const InputDecoration(labelText: TTexts.firstName),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: controller.lastName,
                validator: (value) =>
                    TValidator.validateEmptyText('Frst Name', value),
                expands: false,
                decoration: const InputDecoration(labelText: TTexts.lastName),
              ),
            ]),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save')),
          )
        ]),
      ),
    );
  }
}
