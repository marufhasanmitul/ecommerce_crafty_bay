import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class ProductDetailsReview extends StatelessWidget {
  const ProductDetailsReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star,color: Colors.amberAccent,size: 25,),
        const Text('4.8',style: TextStyle(
            fontSize: 18
        ),),
        const SizedBox(width: 20,),
        const Text('Reviews',style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor
        ),),
        const SizedBox(width: 20,),
        SizedBox(
          width: 33,
          height: 33,
          child: ElevatedButton(
              onPressed: (){},
              child: const Icon(Icons.favorite_border,size: 14,)
          ),
        )
      ],
    );
  }
}