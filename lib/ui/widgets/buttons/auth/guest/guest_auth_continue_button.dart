import 'package:flutter/material.dart';

class GuestAuthContinueButton extends StatelessWidget {
  final Function() onPressed;

  const GuestAuthContinueButton({
    Key? key,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: const Text(
        'Continue',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16
        )
      ),
      height: 45,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 10
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}