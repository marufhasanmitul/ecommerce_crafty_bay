import 'package:ecommerce_crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/utils/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/home_widget/category_card.dart';
import '../widgets/home_widget/home_slider.dart';
import '../widgets/home_widget/search_text_field.dart';
import '../widgets/home_widget/section_header.dart';
import '../widgets/product_card.dart';

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
              const HomeSlider(),
              const SizedBox(
                height: 15,
              ),
              SectionHeader(
                title: 'Categories',
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),

              SizedBox(
                height: 90,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const CategoryCard();
                    }),
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
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context,index){
                      return const ProductCard();
                    }
                ),
              ),
              SectionHeader(
                title: 'Special',
                onTap: () {},
              ),
              SizedBox(
                height: 165,
                child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context,index){
                      return const ProductCard();
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
                      return const ProductCard();
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


