import 'package:e_commerce_app/app/asset_paths.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/widgets/centered_circular_progress.dart';
import 'package:e_commerce_app/features/home/widgets/app_bar_icon_button.dart';
import 'package:e_commerce_app/features/home/widgets/home_banner_slider.dart';
import 'package:e_commerce_app/features/products/presentation/controllers/product_list_controller.dart';
import 'package:e_commerce_app/features/shared/presentation/controllers/main_nav_controller.dart';
import 'package:e_commerce_app/features/shared/presentation/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../shared/presentation/controllers/category_controller.dart';
import '../controller/home_slider_controller.dart';
import '../../../shared/presentation/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ProductListController _newController;
  late final ProductListController _specialController;
  late final ProductListController _popularController;

  @override
  void initState() {
    super.initState();

    // Tag-based controllers for home screen
    _newController = Get.put(ProductListController(tag: "new"), tag: "new");
    _specialController = Get.put(ProductListController(tag: "special"), tag: "special");
    _popularController = Get.put(ProductListController(tag: "popular"), tag: "popular");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _newController.fetchProducts();
      _specialController.fetchProducts();
      _popularController.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(Assetpaths.logoNavSvg),
        actions: [
          AppBarIconButton(onTap: () {}, iconData: Icons.person),
          AppBarIconButton(onTap: () {}, iconData: Icons.call),
          AppBarIconButton(onTap: () {}, iconData: Icons.notifications_on_outlined),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 16),
              GetBuilder<HomeSliderController>(
                builder: (controller) {
                  if (controller.getSlidersInProgress) {
                    return SizedBox(height: 180, child: CenteredCircularProgress());
                  }
                  return HomeBannerSlider(sliders: controller.sliders);
                },
              ),
              const SizedBox(height: 16),
              _buildSectionHeader(
                title: 'Categories',
                onTapSeeAll: () {
                  Get.find<MainNavController>().moveToCategory();
                },
              ),
              _buildCategoryList(),
              _buildSectionHeader(title: 'New', onTapSeeAll: () {}),
              _buildProductSection(controllerTag: "new"),
              _buildSectionHeader(title: 'Special', onTapSeeAll: () {}),
              _buildProductSection(controllerTag: "special"),
              _buildSectionHeader(title: 'Popular', onTapSeeAll: () {}),
              _buildProductSection(controllerTag: "popular"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryController>(
        builder: (controller) {
          if (controller.isInitialLoading) return CenteredCircularProgress();

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categoryList.length > 10
                ? 10
                : controller.categoryList.length,
            itemBuilder: (context, index) {
              return ProductCategoryItem(categoryModel: controller.categoryList[index]);
            },
            separatorBuilder: (_, __) => const SizedBox(width: 10),
          );
        },
      ),
    );
  }

  Widget _buildProductSection({required String controllerTag}) {
    return GetBuilder<ProductListController>(
      tag: controllerTag,
      builder: (controller) {
        if (controller.initialLoading)
          return SizedBox(height: 180, child: CenteredCircularProgress());

        if (controller.products.isEmpty)
          return SizedBox(height: 180, child: Center(child: Text('No products found for $controllerTag')));

        return SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.products.length,
            itemBuilder: (context, index) =>
                ProductCard(productModel: controller.products[index]),
            separatorBuilder: (_, __) => const SizedBox(width: 10),
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader({required String title, required VoidCallback onTapSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        TextButton(onPressed: onTapSeeAll, child: const Text('See all')),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onSubmitted: (text) {},
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: Colors.grey.shade100,
        filled: true,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
