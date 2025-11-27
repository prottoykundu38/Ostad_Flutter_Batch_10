import 'package:e_commerce_app/features/category/presentation/controllers/wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/presentation/widgets/product_card.dart';
class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key, required String categoryName});

  @override
  Widget build(BuildContext context) {
    final WishListController wishListController = Get.find<WishListController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
      ),
      body: GetBuilder<WishListController>(
        init: wishListController,
        builder: (c) {
          if (c.isLoading && c.wishList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (c.wishList.isEmpty) {
            return const Center(
              child: Text(
                "Your wishlist is empty",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,  
                childAspectRatio: 0.72,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: c.wishList.length,
              itemBuilder: (_, index) {
                return ProductCard(
                  productModel: c.wishList[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

