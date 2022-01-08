import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EmailAuthButton extends StatelessWidget {
  final Function() onPressed;

  const EmailAuthButton({
    Key? key,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10
      ),
      child: ElevatedButton(
        onPressed: onPressed, 
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Iconsax.sms,
                size: 25,
                color: Colors.white,
              ),
              Spacer(),
              Text(
                'Sign In with Email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17
                )
              ),
              Spacer(),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          side: const BorderSide(
            color: Colors.black,
          )
        ),
      )
    );
  }
}