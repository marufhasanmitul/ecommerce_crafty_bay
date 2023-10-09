import 'package:ecommerce_crafty_bay/presentation/state_holders/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key, this.categoryId}) : super(key: key);
  final categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductListController>().getProductList(widget.categoryId);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Product List Screen', style: TextStyle(color: Colors.black87)),
        leading: const BackButton(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<ProductListController>(
        builder: (productListController) {
          return GridView.builder(
              itemCount: productListController.productList.data?.length ?? 0,
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
