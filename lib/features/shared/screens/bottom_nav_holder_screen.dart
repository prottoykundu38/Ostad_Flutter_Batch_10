import 'package:e_commerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:e_commerce_app/features/shared/presentation/controllers/main_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavHolderScreen extends StatefulWidget {
  static const String name = '/bottom-nav-holder';
  const BottomNavHolderScreen({super.key});

  @override
  State<BottomNavHolderScreen> createState() => _BottomNavHolderScreenState();
}

class _BottomNavHolderScreenState extends State<BottomNavHolderScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavController>(builder: (MainNavController) {
      return Scaffold(
        body: _screens[MainNavController.currentIndex],
        bottomNavigationBar: NavigationBar(
            selectedIndex: MainNavController.currentIndex,
            onDestinationSelected: MainNavController.changeIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.dashboard_customize_outlined),
                  label: 'Categories'),
              NavigationDestination(
                  icon: Icon(Icons.shopping_cart_checkout), label: 'Cart'),
              NavigationDestination(
                  icon: Icon(Icons.favorite), label: 'Wishlist'),
            ]),
      );
    });
  }
}
