import 'package:ecommerce_crafty_bay/presentation/state_holders/create_review_contorller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/review_product_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/create_review_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/widgets/circular_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';
class ReviewScreen extends StatefulWidget {
  final int productId;
  final int rating;
  const ReviewScreen({Key? key, required this.productId, required this.rating}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ReviewProductController>().getReviewProduct(widget.productId);
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Reviews',
          style: TextStyle(
            color: Colors.black87
          ),
        ),
        leading: const BackButton(
            color: Colors.black87
        ),
        elevation: 0,
      ),
      body:Column(
        children: [
          Expanded(
            child: GetBuilder<ReviewProductController>(
              builder: (controller) {
                if(controller.getReviewProductInProgress){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    itemCount: controller.reviewProduct.data?.length??0,
                    itemBuilder:(context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircularIconButton(
                                      icon:Icons.person,
                                      onTap: () {  },
                                    ),
                                    const SizedBox(width: 10,),
                                     Text(controller.reviewProduct.data?[index].profile?.cusName?? "",style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500
                                    ),)
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                 Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(controller.reviewProduct.data?[index].description??"",style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                  ),),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                );
              }
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
            ),
            child: GetBuilder<ReviewProductController>(
              builder: (controller) {
                return Row(
                  children: [
                    Text("Review (${controller.reviewProduct.data?.length??0})"),
                    const Spacer(),
                    ElevatedButton(
                        onPressed:(){
                          Get.to( CreateReviewScreen(
                            productId:widget.productId,
                            rating:widget.rating,
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder()
                        ),
                        child: const Center(child: Icon(Icons.add)),
                    )
                  ],
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
