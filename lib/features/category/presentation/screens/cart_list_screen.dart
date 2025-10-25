import 'package:e_commerce_app/features/shared/presentation/controllers/main_nav_controller.dart';
import 'package:e_commerce_app/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key, required this.categoryName});

  static const String name = '/cart-list';

  final String categoryName;

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
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
          itemCount: 100,
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
