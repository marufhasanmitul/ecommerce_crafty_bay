import 'package:ecommerce_crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/home_widget/category_card.dart';

class CategoriesListScreen extends StatefulWidget {
  const CategoriesListScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
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
        body: RefreshIndicator(
          onRefresh: ()async{
            Get.find<HomeCategoryController>().getHomeCategory();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GetBuilder<HomeCategoryController>(
              builder: (categoryController) {
                if(categoryController.getHomeCategoryInProgress){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GridView.builder(
                    itemCount: categoryController.getCategory.data?.length ?? 0,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16
                    ),
                    itemBuilder:(context,index){
                      return FittedBox(
                         child: CategoryCard(
                           OnTap: (){
                             Get.to(()=> ProductListScreen(
                               name:categoryController.getCategory.data![index].categoryName ,
                               categoryId:categoryController.getCategory.data![index].id,
                             ));
                           },
                           categoryData: categoryController.getCategory.data![index],
                         ),
                      );
                    }

                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
