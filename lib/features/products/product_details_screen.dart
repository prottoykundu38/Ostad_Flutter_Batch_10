import 'package:e_commerce_app/features/products/presentation/widgets/color_picker.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/product_image_slider.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/size_picker.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/total_price_and_cart_section.dart';
import 'package:e_commerce_app/features/shared/presentation/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';
import '../../app/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              // Added scroll in case content is long
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // 👈 Left-align all children
                  children: [
                    const ProductImageSlider(),
                    const SizedBox(height: 16),
                    const Text(
                      'Nike A123 - New Edition Of Jordan Sports',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 24, color: Colors.amber),
                        const SizedBox(width: 4),
                        const Text(
                          '4.2',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text('Reviews'),
                        ),
                        const SizedBox(width: 8),
                        Card(
                          color: AppColors.themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(
                              Icons.favorite_outline,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Color',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ColorPicker(
                                colors: const ['Red', 'White', 'Black'],
                                onSelected: (String color) {},
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Size',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizePicker(
                                sizes: const ['S', 'M', 'L', 'XL'],
                                onSelected: (String size) {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: IncDecButton(
                            onChange: (int value) {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Description',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'The standard lorem ipsum passage has been a printers friend for centuries. Like stock photos today, it served as a placeholder for actual content. The original text comes from Ciceros philosophical work De Finibus Bonorum et Malorum, written in 45 BC.',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TotalPriceAndCartSection(),
        ],
      ),
    );
  }
}
