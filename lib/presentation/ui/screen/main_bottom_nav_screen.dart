import 'package:ecommerce_crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/categories.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/electronics_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/product_details_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({Key? key}) : super(key: key);

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {


  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const ElectronicsScreen(),
    const ProductDetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
        builder:(controller){
          return Scaffold(
            body: _screens[controller.currentSelectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:controller.currentSelectedIndex,
              onTap:controller.changeScreen,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              elevation: 4,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border), label: 'Wish'),
              ],
            ),
          );
        }

    );




  }
}
