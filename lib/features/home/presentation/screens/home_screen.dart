import 'package:e_commerce_app/app/asset_paths.dart';
import 'package:e_commerce_app/features/home/widgets/app_bar_icon_button.dart';
import 'package:e_commerce_app/features/shared/presentation/controllers/main_nav_controller.dart';
import 'package:e_commerce_app/features/shared/presentation/widgets/home_banner_slider.dart';
import 'package:e_commerce_app/features/shared/presentation/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(Assetpaths.logoNavSvg),
        actions: [
          AppBarIconButton(
            onTap: () {},
            iconData: Icons.person,
          ),
          AppBarIconButton(
            onTap: () {},
            iconData: Icons.call,
          ),
          AppBarIconButton(
            onTap: () {},
            iconData: Icons.notifications_on_outlined,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            _buildSearchBar(),
            const HomeBannerSlider(),
            const SizedBox(
              height: 16,
            ),
            _buildSectionHeader(
              title: 'All Categories',
              onTapSeeAll: () {
                Get.find<MainNavController>().changeIndex(1);
              },
            ),
            _buildCategoryList(),
            const SizedBox(
              height: 16,
            ),
            _buildSectionHeader(
              title: 'New',
              onTapSeeAll: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            _buildSectionHeader(
              title: 'Popular',
              onTapSeeAll: () {
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ProductCategoryItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(
      {required String title, required VoidCallback onTapSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextButton(onPressed: onTapSeeAll, child: Text('See all')),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onSubmitted: (String? text) {},
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: Colors.grey.shade100,
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
