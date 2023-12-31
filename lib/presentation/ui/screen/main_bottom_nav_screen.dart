import 'package:ecommerce_crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/new_product_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/special_product_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/cart_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/categories_list.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/wish_list_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/home_slider_controller.dart';
import 'home_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({Key? key}) : super(key: key);

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSliderController>().getHomeSlider();
      Get.find<HomeCategoryController>().getHomeCategory();
      Get.find<PopularProductController>().getPopularProduct();
      Get.find<SpecialProductController>().getSpecialProduct();
      Get.find<NewProductController>().getNewProduct();
    });

    super.initState();
  }


  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesListScreen(),
    const CartScreen(),
    const WishListScreen(),
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
