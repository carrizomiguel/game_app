import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GuestInputName extends StatelessWidget {
  final Function(String?) onSaved;
  final TextEditingController controller;

  const GuestInputName({
    Key? key,
    required this.onSaved,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).textTheme.subtitle1!.color;
    return TextFormField(
      cursorColor: primaryColor,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Iconsax.user,
          color: primaryColor,
          size: 18
        ),
        labelText: 'Tell us your name',
        labelStyle: TextStyle(
          color: primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w400
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor!,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        floatingLabelStyle: TextStyle(
          color: primaryColor,
          fontSize: 18
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(10),
        )
      ),
      onSaved: onSaved,
      validator: (value) {
        if (value!.isEmpty) return "Name required";
      },
      controller: controller,
    );
  }
}