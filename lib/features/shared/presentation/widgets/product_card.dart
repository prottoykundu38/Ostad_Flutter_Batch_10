import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/app/constants.dart';
import 'package:e_commerce_app/features/products/product_details_screen.dart';
import 'package:e_commerce_app/features/shared/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.productModel,
    
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: productModel.id);
      },
      child: Card(
        color: Colors.white,
        elevation: 2,
        shadowColor: AppColors.themeColor.withOpacity(0.2),
        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.themeColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )),
                child: Image.network(
                  productModel.photos.firstOrNull ?? '',
                  width: 140,
                  height: 80,
                  errorBuilder: (_, __, ___) {
                    return SizedBox(
                      width: 140,
                      height: 80,
                      child: Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      productModel.title,
                      maxLines: 1,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    Row(
                      // spacing: 4;
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$takaSign${productModel.currentprice}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.themeColor,
                          ),
                        ),
                        Wrap(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.amber,
                            ),
                            Text(productModel.rating.toString()),
                          ],
                        ),
                        Card(
                          color: AppColors.themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(
                              Icons.favorite_outline,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
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
