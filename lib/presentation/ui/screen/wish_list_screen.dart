import 'package:ecommerce_crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish List', style: TextStyle(color: Colors.black87)),
        leading: const BackButton(color: Colors.black87),
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
    );
  }
}
