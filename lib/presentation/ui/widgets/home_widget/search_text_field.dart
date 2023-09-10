import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.grey.shade300,
          filled: true,
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search',
          border:
          const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder:
          const OutlineInputBorder(borderSide: BorderSide.none),

          enabledBorder:
          const OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}