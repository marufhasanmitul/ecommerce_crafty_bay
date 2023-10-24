

import 'package:ecommerce_crafty_bay/presentation/ui/screen/product_details_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/widgets/product_details/custom_staper_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../../data/models/cart_list_model.dart';
import '../../state_holders/car_list_controller.dart';
import '../utils/app_color.dart';
class CartProductCard extends StatelessWidget {
  final CartData cartData;
  const CartProductCard({
    super.key, required this.cartData
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> ProductDetailsScreen(productId: cartData.product!.id!));
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(
                          cartData.product?.image?? 'https://photo.teamrabbil.com/images/2023/04/04/product.png',
                      )
                  )
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(cartData.product?.title?? "New Year Special Shoe",
                                style:
                                const TextStyle(fontSize: 18, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              RichText(
                                text:TextSpan(
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                  children: [
                                    TextSpan(text: '${cartData.color} ,'),
                                    TextSpan(text:" ${cartData.size}"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {

                              deleteAlert(context);

                            },
                            icon: const Icon(Icons.delete_outline))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          '\$${cartData.product?.price?? 200}',
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 85,
                          child: FittedBox(
                            child: CustomStepper(
                              lowerLimit: 1,
                              upperLimit: 20,
                              stepValue: 1,
                              value: cartData.quantity??1,
                              onChange: (int value) {

                                Get.find<CartListController>().changeItem(cartData.id!, value);
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void deleteAlert(BuildContext context) {
       showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.warning),
                SizedBox(width: 15,),
                Text("Delete"),
              ],
            ),
            content: const Text("Are You sure You want to delete Product"),
            actions: [
              TextButton(
                  onPressed:(){
                    Get.find<CartListController>().removeFromCart(cartData.productId?? 0);
                    Get.find<CartListController>().getCartList();
                    Get.back();
                  },
                  child: const Text("Yes")
              ),
              TextButton(
                  onPressed:(){
                    Get.back();
                  },
                  child: const Text("No")
              ),
            ],

          );
        }
    );
  }
}