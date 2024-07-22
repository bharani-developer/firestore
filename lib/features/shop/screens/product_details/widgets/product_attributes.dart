import 'package:flutter/material.dart';
import 'package:store/common/widgets/chips/choice_chip.dart';
import 'package:store/common/widgets/containers/rounded_container.dart';
import 'package:store/common/widgets/texts/product_price.dart';
import 'package:store/common/widgets/texts/product_title.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // -- Selected Attribute Pricing & Description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const TSectionHeading(
                    title: 'Variants',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Price',
                            smallSize: false,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          const TProductPriceText(price: '20')
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Stock',
                            smallSize: false,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          Text('InStock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),

                      // -- Stock
                      const Row(
                        children: [
                          TProductTitleText(title: 'Stock', smallSize: false)
                        ],
                      ),
                      // const TProductTitleText(
                      //   title:
                      //       'This is the description of the  Product and it can go up to max 4 lines',
                      //   smallSize: false,
                      //   maxLines: 4,
                      // )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Column(
          children: [
            Wrap(
              spacing: 8,
              children: [
                const TSectionHeading(
                  title: 'Colors',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                TChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (bool selected) {
                    // Handle chip selection
                  },
                ),
                // Add spacing between chips if needed
                TChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (bool selected) {
                    // Handle chip selection
                  },
                ),
                // Add spacing between chips if needed
                TChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (bool selected) {
                    // Handle chip selection
                  },
                ),
                // Add spacing between chips if needed
                TChoiceChip(
                  text: 'Red',
                  selected: false,
                  onSelected: (bool selected) {
                    // Handle chip selection
                  },
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            const TSectionHeading(
              title: 'Sizes',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'EU 34',
                  selected: true,
                  onSelected: (bool selected) {
                    // Handle chip selection
                  },
                ),
                // Add spacing between chips if needed
                TChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (bool selected) {
                    // Handle chip selection
                  },
                ),
                // Add spacing between chips if needed
                TChoiceChip(
                  text: 'EU 38',
                  selected: false,
                  onSelected: (bool selected) {
                    // Handle chip selection
                  },
                ),
                // Add spacing between chips if needed
                TChoiceChip(
                  text: 'EU 39',
                  selected: false,
                  onSelected: (bool selected) {
                    // Handle chip selection
                  },
                ),
                // Add spacing between chips if needed
                TChoiceChip(
                  text: 'EU 40',
                  selected: false,
                  onSelected: (bool selected) {
                    // Handle chip selection
                  },
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
