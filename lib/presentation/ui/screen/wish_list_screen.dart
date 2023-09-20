import 'package:ecommerce_crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wish List', style: TextStyle(color: Colors.black87)),
          leading: IconButton(
            onPressed: (){
              Get.find<MainBottomNavController>().backToHome();
            },
            icon:const Icon(Icons.arrow_back,color: Colors.black87,)
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: GridView.builder(
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 20, crossAxisSpacing: 0),
            itemBuilder: (context, index) {
              return const FittedBox(child: ProductCard());
            }),
      ),
    );
  }
}
