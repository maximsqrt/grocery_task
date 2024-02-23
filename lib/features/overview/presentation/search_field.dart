import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search keywords...',
          prefixIcon: Icon(Icons.search),
          fillColor: Color(0xffe4e5e9),
          filled: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
