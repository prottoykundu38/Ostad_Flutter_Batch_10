import 'package:e_commerce_app/features/auth/presentation/screens/widgets/centered_circular_progress.dart';
import 'package:e_commerce_app/features/products/presentation/controllers/product_list_controller.dart';
import 'package:e_commerce_app/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shared/data/models/category_model.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  static const String name = '/product-list';
  final CategoryModel category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late final ScrollController _scrollController;
  late final ProductListController _productController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_loadMoreData);

    // Category-wise controller (tag = category.id)
    _productController = Get.put(
      ProductListController(tag: widget.category.id),
      tag: widget.category.id,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productController.fetchProducts();
    });
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 400) {
      _productController.fetchProducts();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.title)),
      body: GetBuilder<ProductListController>(
        tag: widget.category.id,
        builder: (controller) {
          if (controller.initialLoading)
            return CenteredCircularProgress();

          if (controller.products.isEmpty)
            return const Center(child: Text('No products found.'));

          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) =>
                      ProductCard(productModel: controller.products[index]),
                ),
              ),
              if (controller.loading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: LinearProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}
