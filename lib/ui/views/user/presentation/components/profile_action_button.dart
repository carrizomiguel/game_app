import 'package:flutter/material.dart';

class ProfileActionButton extends StatelessWidget {
  const ProfileActionButton({
    Key? key,
    this.leadingIcon,
    this.trailingIcon,
    required this.actionString,
  }) : super(key: key);

  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final String actionString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              if(leadingIcon != null) ...[
                Icon(
                  leadingIcon,
                ),
                const SizedBox(width: 10,),
              ],
              Text(
                actionString,
                style: const TextStyle(
                  fontSize: 17
                ),
              ),
              if(trailingIcon != null) ...[
                const Spacer(),
                Icon(
                  trailingIcon,
                ),
              ],
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}