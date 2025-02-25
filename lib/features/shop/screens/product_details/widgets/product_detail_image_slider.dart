import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/icons/circular_icon.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/common/widgets/curved_edges/curved_edges_widget.dart';
import 'package:store/common/widgets/images/rounded_image.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            const TAppBar(
              showBackArrow: true,
              actions: [TCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            ),
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(TImages.productImage5),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    itemCount: 6,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                    itemBuilder: (_, __) => TRoundedImage(
                          width: 80,
                          backgroundColor: dark ? TColors.black : TColors.white,
                          border: Border.all(color: TColors.primary),
                          padding: const EdgeInsets.all(TSizes.sm),
                          imageUrl: TImages.productImage3,
                        ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
