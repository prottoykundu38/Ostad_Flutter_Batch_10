import 'package:e_commerce_app/features/auth/presentation/screens/widgets/centered_circular_progress.dart';
import 'package:e_commerce_app/features/products/presentation/controllers/product_details_controller.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/color_picker.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/product_image_slider.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/size_picker.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/total_price_and_cart_section.dart';
import 'package:e_commerce_app/features/shared/presentation/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product-details';
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController =
      ProductDetailsController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productDetailsController.getproductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: GetBuilder(
        init: _productDetailsController,
        builder: (controller) {
          if (controller.getproductDetailsInProgress) {
            return const CenteredCircularProgress();
          }

          if (controller.errorMessage != null) {
            return Center(child: Text(controller.errorMessage!));
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageSlider(
                        imageurls: controller.productDetails?.photos ?? [],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.productDetails?.title ?? '',
                                        style: textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          const Icon(Icons.star,
                                              size: 22, color: Colors.amber),
                                          const SizedBox(width: 4),
                                          Text(
                                            controller.productDetails?.rating ??
                                                '',
                                            style: const TextStyle(fontSize: 18),
                                          ),
                                          const SizedBox(width: 8),
                                          TextButton(
                                              onPressed: () {},
                                              child: const Text('Reviews')),
                                          const SizedBox(width: 6),
                                          Card(
                                            color: AppColors.themeColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: IncDecButton(
                                    onChange: (value) {},
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            if ((controller.productDetails?.colors ?? [])
                                .isNotEmpty) ...[
                              const Text(
                                'Color',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              ColorPicker(
                                colors:
                                    controller.productDetails?.colors ?? [],
                                onSelected: (color) {},
                              ),
                              const SizedBox(height: 16),
                            ],
                            if ((controller.productDetails?.sizes ?? [])
                                .isNotEmpty) ...[
                              const Text(
                                'Size',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              SizePicker(
                                sizes:
                                    controller.productDetails?.sizes ?? [],
                                onSelected: (size) {},
                              ),
                              const SizedBox(height: 16),
                            ],
                            const Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              controller.productDetails?.description ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TotalPriceAndCartSection(),
            ],
          );
        },
      ),
    );
  }
}
