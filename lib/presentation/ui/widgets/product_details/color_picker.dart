import 'package:ecommerce_crafty_bay/presentation/ui/utils/color_extension.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker(
      {super.key,
      required this.colors,
      required this.initialColor,
      required this.onSelected});

  final List<String> colors;
  final int initialColor;
  final Function(int selectIndex) onSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int _selectedColorIndex = 0;

  @override
  void initState() {
    _selectedColorIndex = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.colors.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            _selectedColorIndex = index;
            widget.onSelected(index);
            if (mounted) {
              setState(() {});
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
                color: _selectedColorIndex == index
                    ? AppColors.primaryColor
                    : null),
            alignment: Alignment.center,
            child: Text(widget.colors[index]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 8,
        );
      },
    );
  }
}
