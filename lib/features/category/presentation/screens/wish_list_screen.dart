import 'package:e_commerce_app/features/shared/presentation/controllers/main_nav_controller.dart';
import 'package:e_commerce_app/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key, required this.categoryName});

  static const String name = '/cart-list';

  final String categoryName;

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        leading: BackButton(
          onPressed: (){
            Get.find<MainNavController>().changeIndex(0);
          },
        ),
      ),
      body: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // crossAxisSpacing: 8,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return FittedBox(child: ProductCard());
          }),
    );
  }
}
