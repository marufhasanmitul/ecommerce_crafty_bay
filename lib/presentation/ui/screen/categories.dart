import 'package:ecommerce_crafty_bay/presentation/ui/widgets/home_widget/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories',style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black87,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
            itemCount: 40,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16
            ),
            itemBuilder:(context,index){
              return const FittedBox(
                child: CategoryCard(),
              );
            }

        ),
      ),
    );
  }
}