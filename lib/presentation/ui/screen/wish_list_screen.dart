import 'package:ecommerce_crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/wish_list_controller.dart';
import '../widgets/product_card.dart';
import '../widgets/wish_list_product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<WishListScreenController>().getWishlistProducts();
    });
    super.initState();
  }


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
        body: GetBuilder<WishListScreenController>(
          builder: (wishListScreenController) {
            if(wishListScreenController.getWishListProductsInProgress){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(wishListScreenController.wishListProductModel.data != null &&
                wishListScreenController.wishListProductModel.data!.isEmpty){
              return const Center(
                child: Text('WishList is empty!'),
              );

            }
            return GridView.builder(
                itemCount: wishListScreenController.wishListProductModel.data?.length??0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 20, crossAxisSpacing: 0),
                itemBuilder: (context, index) {
                  return  FittedBox(child: WishListProductCard(
                     productData:wishListScreenController.wishListProductModel.data![index],
                  ));
                });
          }
        ),
      ),
    );
  }
}
