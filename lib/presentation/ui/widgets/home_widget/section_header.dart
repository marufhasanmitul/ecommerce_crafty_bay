import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.title, required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: const TextStyle(
            color:Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),),
        TextButton(
            onPressed:onTap,
            child:const Text("See all",style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16
            ),)
        )

      ],
    );
  }
}