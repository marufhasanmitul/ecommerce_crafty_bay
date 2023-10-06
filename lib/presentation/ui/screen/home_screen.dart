import 'package:ecommerce_crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/special_product_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/utils/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/home_widget/category_card.dart';
import '../widgets/home_widget/home_slider.dart';
import '../widgets/home_widget/search_text_field.dart';
import '../widgets/home_widget/section_header.dart';
import '../widgets/product_card.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImageAssets.craftyBayNavSvg),
            const Spacer(),
            CircularIconButton(
              icon: Icons.person,
              onTap: () {},
            ),
            CircularIconButton(
              icon: Icons.call,
              onTap: () {},
            ),
            CircularIconButton(
              icon: Icons.notifications_active,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SearchTextField(),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<HomeSliderController>(
                builder: (homeSliderController) {
                  if(homeSliderController.getHomeSliderInProgress){
                    return const SizedBox(
                      height: 180,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return HomeSlider(
                    sliders: homeSliderController.sliderModel.data ??[],
                  );
                }
              ),
              const SizedBox(
                height: 15,
              ),
              SectionHeader(
                title: 'Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 90,
                child: GetBuilder<HomeCategoryController>(
                  builder: (categoryController) {
                    if(categoryController.getHomeCategoryInProgress){
                      return const SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }


                    return ListView.builder(
                        itemCount: categoryController.getCategory.data?.length ?? 0 ,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            categoryData:categoryController.getCategory.data![index] ,
                          );
                        });
                  }
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SectionHeader(
                title: 'Popular',
                onTap: () {},
              ),
              SizedBox(
                height: 165,
                child: GetBuilder<PopularProductController>(
                  builder: (productController) {
                    if(productController.getPopularProductInProgress){
                      return const Center(child: CircularProgressIndicator(),);
                    }

                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.getPopularProductModel.data?.length ?? 0,
                        itemBuilder: (context,index){
                          return ProductCard(
                            product: productController.getPopularProductModel.data![index],
                          );
                        }
                    );
                  }
                ),
              ),
              SectionHeader(
                title: 'Special',
                onTap: () {},
              ),
              SizedBox(
                height: 165,
                child: GetBuilder<SpecialProductController>(
                  builder: (specialProductController) {
                    if(specialProductController.getSpecialProductInProgress){
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    return ListView.builder(
                       scrollDirection: Axis.horizontal,
                        itemCount: specialProductController.getSpecialProductModel.data?.length ?? 0,
                        itemBuilder: (context,index){
                          return  ProductCard(
                            product:specialProductController.getSpecialProductModel.data![index],
                          );
                        }
                    );
                  }
                ),
              ),
              SectionHeader(
                title: 'New',
                onTap: () {},
              ),
              SizedBox(
                height: 165,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context,index){
                      //return const ProductCard();
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


