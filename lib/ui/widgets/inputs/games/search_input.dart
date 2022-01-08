import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
    required this.onChanged 
  }) : super(key: key);

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Iconsax.search_normal_1,
          color: Colors.grey.shade400,
        ),
        contentPadding: EdgeInsets.zero,
        label: Text(
          'Search',
          style: TextStyle(
            color: Colors.grey.shade400
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.5
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.5
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(10)
        ),
      ),
      cursorColor: Colors.grey.shade400,
      onChanged: onChanged
    );
  }
}