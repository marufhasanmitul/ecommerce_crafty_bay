import 'package:ecommerce_crafty_bay/presentation/ui/screen/categories.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/create_review_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/electronics_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/reviews_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/wish_list_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({Key? key}) : super(key: key);

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex=0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const ElectronicsScreen(),
    const ReviewScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index){
          _selectedIndex=index;
          if(mounted){
            setState(() {});
          }
        },
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        elevation: 4,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home'

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Categories'

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart'

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Wish'

          ),


        ],
      ),
    );
  }
}
