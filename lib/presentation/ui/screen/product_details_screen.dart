import 'package:ecommerce_crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/create_wish_list_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/create_review_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/reviews_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/widgets/product_details/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_color.dart';
import '../widgets/product_details/color_picker.dart';
import '../widgets/product_details/custom_staper_button.dart';
import '../widgets/product_details/product_image_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {


  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;
  int quanity=1;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProduct(widget.productId);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
            if(productDetailsController.getProductDetailsInProgress){
             return const Center(
               child: CircularProgressIndicator(),
             ) ;
            }
            if(productDetailsController.getProductModel.data!.isEmpty){
              return const Center(
                child: Text("Data is Empty"),
              ) ;
            }
            
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ProductImageSlider(
                              imageList: [
                                productDetailsController.getProductDetails.img1 ??'',
                                productDetailsController.getProductDetails.img2 ??'',
                                productDetailsController.getProductDetails.img3 ??'',
                                productDetailsController.getProductDetails.img4 ??'',
                              ],
                            ),
                            productDetailsAppBar,
                          ],
                        ),
                        productColorSizeDescription(productDetailsController),
                      ],
                    ),
                  ),
                ),
                productDetailsAddToCart(productDetailsController),
              ],
            );
          }
        ),
      ),
    );
  }

  Padding productColorSizeDescription(ProductDetailsController productDetailsController) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productNameStaper(
              productDetailsController.getProductDetails.product?.title??''
          ),
          productReview(productDetailsController.getProductDetails.product?.star?? 0,productDetailsController.getProductDetails.product?.id?? 0),
          const Text(
            'Color',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 28,
            child: ColorPicker(
              colors: productDetailsController.availableColors,
              initialColor: 0,
              onSelected: (int selectIndex) {
                _selectedColorIndex=selectIndex;
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Size',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              height: 28,
              child: SizePicker(
                  sizes: productDetailsController.availableSize,
                  onSelected: (int onSelected) {
                    _selectedSizeIndex=onSelected;
                  },
                  initialSelected: 0)),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
           Text(productDetailsController.getProductDetails.des??''),
        ],
      ),
    );
  }

  Row productReview(int reviewStar,int productId) {
    return Row(
      children: [
         Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            Text(
              '$reviewStar',
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.to( ReviewScreen(productId: productId));
          },
          child: const Text(
            'Review',
            style: TextStyle(
                fontSize: 15,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        GetBuilder<CreateWishListController>(
          builder: (createWishListController) {
            return InkWell(
              onTap: ()async{
                 await createWishListController.createWishList(productId);
                 Get.snackbar("Wish List", "Added WishList");
              },
              child: const Card(
                color: AppColors.primaryColor,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }
        )
      ],
    );
  }

  Row productNameStaper(String name) {
    return Row(
      children: [
         Expanded(
            child: Text(name,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 0.5),
        )),
        CustomStepper(
            lowerLimit: 1,
            upperLimit: 10,
            stepValue: 1,
            value: 1,
            onChange: (newValue) {
              quanity=newValue;
            })
      ],
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      leading: const BackButton(
        color: Colors.black54,
      ),
      title: const Text(
        'Product details',
        style: TextStyle(color: Colors.black54),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Container productDetailsAddToCart(ProductDetailsController productDetailsController) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "\$ ${productDetailsController.getProductDetails?.product?.price ?? "" }",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: GetBuilder<AddToCartController>(
                builder: (addToCartController) {
                  if(addToCartController.addToCartInProgress){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  return ElevatedButton(
                    onPressed: () async{
                      final result= await addToCartController.getAddToCart(

                        productDetailsController.getProductDetails.productId!,
                        productDetailsController.availableColors[_selectedColorIndex],
                        productDetailsController.availableSize[_selectedSizeIndex],
                        quanity

                      );
                      if(result){
                        Get.snackbar('Added to cart',
                            'This product has been added to cart list',
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    child: const Text('Add to cart'),
                  );
                }
            ),
          )
        ],
      ),
    );
  }


}
