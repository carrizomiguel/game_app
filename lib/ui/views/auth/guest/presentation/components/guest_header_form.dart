import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class GuestHeaderForm extends StatelessWidget {
  const GuestHeaderForm({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInDown(
          child: const Image(
            image: AssetImage(
              'assets/images/auth/guest.png',
            ),
            width: double.infinity,
            gaplessPlayback: true,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 15),
        FadeInDown(
          child: const Text(
            "Let's get to know\neach other",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          delay: const Duration(milliseconds: 200),
        ),
        const SizedBox(height: 15),
        FadeInDown(
          child: Text(
            'So we can start',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[400]
            )
          ),
          delay: const Duration(milliseconds: 200),
        ),
        const SizedBox(height: 25),
      ]
    );
  }
}