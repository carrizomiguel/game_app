import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 55,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey.shade400,
          child: Icon(
            Iconsax.user,
            color: Colors.grey.shade600,
            size: 40,
          ),
        ),
      ),
    );
  }
}