import 'package:ecommerce_crafty_bay/data/models/popular_product_model.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  final int? categoryId;
  final ProductModel? productModel;
  final String? name;
  const ProductListScreen({Key? key, this.categoryId, this.productModel, this.name}) : super(key: key);


  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(widget.categoryId !=null){
        Get.find<ProductListController>().getProductList(widget.categoryId!);
      }else if(widget.productModel !=null){
        Get.find<ProductListController>().setProducts(widget.productModel!);
      }


    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
             Text('${widget.name} Product List', style: const TextStyle(color: Colors.black87)),
        leading: const BackButton(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<ProductListController>(
        builder: (productListController) {
          if(productListController.getProductListInProgress){
            return const Center(child: CircularProgressIndicator(),);
          }else if( productListController.productList.data?.isEmpty??true){
            return const Center(child: Text("Product Empty"),);
          }
          return GridView.builder(
              itemCount: productListController.productList.data?.length?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 20, crossAxisSpacing: 0),
              itemBuilder: (context, index) {
                return FittedBox(child: ProductCard(
                  product:productListController.productList.data![index] ,
                ));
              });
        }
      ),
    );
  }
}
