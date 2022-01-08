import 'package:flutter/material.dart';
import 'package:games_app/ui/views/auth/bloc/auth_navigation_bloc.dart';
import 'package:games_app/ui/views/auth/pages/on_boarding_page.dart';
import 'package:games_app/ui/views/user/presentation/components/profile_action_button.dart';
import 'package:games_app/ui/views/user/presentation/components/profile_avatar.dart';
import 'package:games_app/ui/views/user/presentation/components/switch_button_theme.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UserView();
  }
}

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: IconButton(
          icon: Icon(
            Iconsax.arrow_left,
            color: Theme.of(context).iconTheme.color
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: SwitchButtonTheme(),
          )
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          const ProfileAvatar(),
          const SizedBox(height: 20),
          Text(
            'Guest',
            style: TextStyle(
              color: Theme.of(context).textTheme.subtitle1!.color,
              fontSize: 20
            )
          ),
          const SizedBox(height: 40),
          const ProfileActionButton(
            leadingIcon: Iconsax.user_edit,
            actionString: 'Edit profile',
            trailingIcon: Iconsax.arrow_right_3,
          ),
          const ProfileActionButton(
            leadingIcon: Iconsax.setting,
            actionString: 'Settings',
            trailingIcon: Iconsax.arrow_right_3,
          ),
          const ProfileActionButton(
            leadingIcon: Iconsax.notification,
            actionString: 'Notifications',
            trailingIcon: Iconsax.arrow_right_3,
          ),
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) {
                  return const OnBoardingPage();
                }), 
                (route) => false
              );
              context.read<AuthNavigationBloc>().add(
                const AuthNavigationEvent.changeView(AuthView.initial)
              );
            },
            child: const ProfileActionButton(
              leadingIcon: Iconsax.logout,
              actionString: 'Sign Out',
            ),
          ),
        ],
      ),
    );
  }
}