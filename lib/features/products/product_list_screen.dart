import 'package:e_commerce_app/features/auth/presentation/screens/widgets/centered_circular_progress.dart';
import 'package:e_commerce_app/features/products/presentation/controllers/product_list_controller.dart';
import 'package:e_commerce_app/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../shared/data/models/category_model.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen(
      {super.key, required this.category, required String categoryName});

  static const String name = '/product-list';

  final CategoryModel category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final ProductListController _productListController = ProductListController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productListController.getProductListByCategory(widget.category.id);
    });
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _productListController.getProductListByCategory(widget.category.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.title),
      ),
      body: GetBuilder(
          init: _productListController,
          builder: (controller) {
            if (controller.isInitialLoading) {
              return CenteredCircularProgress();
            }

            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      controller: _scrollController,
                      itemCount: controller.productList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        // crossAxisSpacing: 8,
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        return FittedBox(
                            child: ProductCard(
                          productModel: controller.productList[index],
                        ));
                      }),
                ),
                Visibility(
                    visible: controller.getProductsInProgress,
                    child: LinearProgressIndicator()),
              ],
            );
          }),
    );
  }
}
