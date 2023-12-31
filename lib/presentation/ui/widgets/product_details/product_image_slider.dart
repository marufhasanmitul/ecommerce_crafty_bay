import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../utils/app_color.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({Key? key, required this.imageList})
      : super(key: key);
  final List<String> imageList;

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 300.0,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1,
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: widget.imageList.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      image: DecorationImage(image: NetworkImage(imageUrl)),),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _selectedSlider,
              builder: (context, value, _) {
                List<Widget> list = [];
                for (int i = 0; i < widget.imageList.length; i++) {
                  list.add(Container(
                    width: 12,
                    height: 12,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color:
                            value == i ? AppColors.primaryColor : Colors.white),
                  ));
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list,
                );
              }),
        )
      ],
    );
  }
}
