import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleAuthButton extends StatelessWidget {
  final Function() onPressed;

  const GoogleAuthButton({
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
            children: [
              SvgPicture.asset(
                'assets/icons/google-icon.svg',
                height: 25,
              ),
              const Spacer(),
              const Text(
                'Sign In with Google',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17
                )
              ),
              const Spacer(),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
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