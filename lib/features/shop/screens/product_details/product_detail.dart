import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:store/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddRoCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- Product Image Slider
            const ProductImageSlider(),

            // --- Product Details
            Padding(
              padding: const EdgeInsets.only(
                left: TSizes.defaultSpace,
                right: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // -- Rating & Share

                  const RatingAndShare(),
                  // -- Price Title Stock & Brand
                  const ProductMetaData(),
                  // -- Attributes
                  const ProductAttributes(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // -- Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // -- Description
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at elit sit amet lectus porta elementum et a magna. Nam eget sem eros. Sed sed diam eget erat pellentesque sagittis. Sed tempus faucibus magna, eu cursus enim hendrerit luctus. Vestibulum mollis pellentesque nulla, eget bibendum metus vehicula eget.',
                    trimLength: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  // -- Reviews
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: 'Reviews(52)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () => Get.to(const ProductReviewsScreen()),
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
