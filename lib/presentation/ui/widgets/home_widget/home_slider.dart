import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/slider_data.dart';
import '../../utils/app_color.dart';

class HomeSlider extends StatefulWidget {
  final List<SliderData> sliders;

  const HomeSlider({Key? key, required this.sliders}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: widget.sliders.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration:  BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: Stack(
                          children: [
                            Image.network(sliderData.image?? ''),
                            Positioned(
                              bottom: 0,
                                child: Text(
                                  sliderData.title??'',style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white
                                ),
                                ),
                            )
                          ]
                      )
                    ));
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder(
            valueListenable: _selectedSlider,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i < widget.sliders.length; i++) {
                list.add(Container(
                  width: 10,
                  height: 10,
                  margin:
                  const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: value == i ? AppColors.primaryColor : null),
                ));
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              );
            })
      ],
    ) ;
  }
}