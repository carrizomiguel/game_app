import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/ui/views/auth/bloc/auth_navigation_bloc.dart';
import 'package:games_app/ui/views/auth/guest/presentation/pages/guest_page.dart';
import 'package:games_app/ui/widgets/buttons/auth/email/email_auth_button.dart';
import 'package:games_app/ui/widgets/buttons/auth/google/google_auth_button.dart';
import 'package:games_app/ui/widgets/buttons/auth/guest/guest_auth_button.dart';
import 'package:games_app/ui/widgets/loading/normal_loading.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthNavigationBloc, AuthNavigationState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          google: () {},
          email: () {},
          guest: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (_) => const GuestPage()
            )
          ),
        );
      },
      child: const OnBoardingView(),
    );
  }
}

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthNavigationBloc, AuthNavigationState>(
        builder: (context, state) {
          return state.when(
            initial: () => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInDown(
                    child: Image.asset('assets/images/auth/signin.png')
                  ),
                  const SizedBox(height: 40),
                  FadeInDown(
                    child: Text('Welcome',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.caption?.color,
                        fontSize: 30,
                      ),
                    ),
                    delay: const Duration(milliseconds: 200),
                  ),
                  FadeInDown(
                    child: Text(
                      "Let's start this adventure gamer.",
                      style: TextStyle(
                        color: Theme.of(context)
                            .textTheme.caption?.color!
                            .withOpacity(.7),
                        fontSize: 15,
                      ),
                    ),
                    delay: const Duration(milliseconds: 200),
                  ),
                  const SizedBox(height: 30),
                  FadeInDown(
                    child: GoogleAuthButton(onPressed: () {}),
                    delay: const Duration(milliseconds: 500),
                  ),
                  FadeInDown(
                    child: EmailAuthButton(onPressed: () {}),
                    delay: const Duration(milliseconds: 500),
                  ),
                  FadeInDown(
                    child: GuestAuthButton(
                      onPressed: () => context.read<AuthNavigationBloc>()
                          .add(const AuthNavigationEvent.changeView(
                            AuthView.guest
                          ))
                    ),
                    delay: const Duration(milliseconds: 500),
                  ),
                ],
              ),
            ),
            google: () => normalLoading(context),
            email: () => normalLoading(context),
            guest: () => normalLoading(context)
          );
        },
      ),
    );
  }
}
