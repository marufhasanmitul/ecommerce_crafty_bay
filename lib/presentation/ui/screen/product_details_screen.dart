import 'package:ecommerce_crafty_bay/presentation/ui/widgets/product_details/size_picker.dart';
import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../widgets/product_details/color_picker.dart';
import '../widgets/product_details/custom_staper_button.dart';
import '../widgets/product_details/product_image_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = [
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.black,
  ];

  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const ProductImageSlider(),
                        productDetailsAppBar,
                      ],
                    ),
                    productColorSizeDescription,
                  ],
                ),
              ),
            ),
            productDetailsAddtoCart,
          ],
        ),
      ),
    );
  }

  Padding get productColorSizeDescription {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productNameStaper,
          productReview,
          const Text(
            'Color',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 28,
            child: ColorPicker(
              colors: colors,
              initialColor: 0,
              onSelected: (int selectIndex) {},
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Size',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              height: 28,
              child: SizePicker(
                  sizes: sizes,
                  onSelected: (int onSelected) {},
                  initialSelected: 0)),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
              '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                          '''),
        ],
      ),
    );
  }

  Row get productReview {
    return Row(
      children: [
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            Text(
              '4.5',
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Review',
            style: TextStyle(
                fontSize: 15,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        const Card(
          color: AppColors.primaryColor,
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(
              Icons.favorite_border,
              size: 16,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Row get productNameStaper {
    return Row(
      children: [
        const Expanded(
            child: Text(
          'Addidas Shoe HK23454 - Black Edition',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 0.5),
        )),
        CustomStepper(
            lowerLimit: 1,
            upperLimit: 10,
            stepValue: 1,
            value: 1,
            onChange: (newValue) {})
      ],
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      leading: const BackButton(
        color: Colors.black54,
      ),
      title: const Text(
        'Product details',
        style: TextStyle(color: Colors.black54),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Container get productDetailsAddtoCart {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: addToCartBotton,
    );
  }

  Row get addToCartBotton {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black54),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '\$1000',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.primaryColor),
            ),
          ],
        ),
        SizedBox(
          width: 120,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Add to cart'),
          ),
        )
      ],
    );
  }
}
