import 'package:ecommerce_crafty_bay/data/models/category_data.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryData,
  });

  final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            height: 62,
            width: 62,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8)
            ),
            child: Image.network(categoryData.categoryImg??'',height: 50,),
          ),
          const SizedBox(height: 8,),
           Text(
            categoryData.categoryName ?? '',
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.primaryColor
          ),)
        ],
      ),
    );

  }
}