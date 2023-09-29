import 'package:ecommerce_crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:()async{
        Get.find<MainBottomNavController>().backToHome();
        return false;
      } ,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories',style: TextStyle(color: Colors.black87)),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back,color: Colors.black87,),
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
                  // child: CategoryCard(),
                );
              }

          ),
        ),
      ),
    );
  }
}
