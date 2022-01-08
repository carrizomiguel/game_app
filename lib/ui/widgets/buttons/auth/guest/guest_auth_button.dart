import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GuestAuthButton extends StatelessWidget {
  final Function() onPressed;

  const GuestAuthButton({
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
                Iconsax.user,
                size: 25,
                color: Colors.white,
              ),
              Spacer(),
              Text(
                'Sign In as Guest',
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
          primary: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
        ),
      )
    );
  }
}