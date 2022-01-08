import 'package:flutter/material.dart';
import 'package:games_app/ui/views/auth/bloc/auth_navigation_bloc.dart';
import 'package:games_app/ui/views/auth/guest/data/repositories/guest_repository_impl.dart';
import 'package:games_app/ui/views/auth/guest/presentation/bloc/guest_bloc.dart';
import 'package:games_app/ui/views/auth/guest/presentation/components/guest_body_form.dart';
import 'package:games_app/ui/views/auth/guest/presentation/components/guest_header_form.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuestPage extends StatelessWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GuestView();
  }
}

class GuestView extends StatelessWidget {
  const GuestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context
                .read<AuthNavigationBloc>()
                .add(const AuthNavigationEvent.changeView(AuthView.initial));
            Navigator.pop(context);
          },
          icon: Icon(
            Iconsax.arrow_left,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text(
          'Guest', 
          style: Theme.of(context).textTheme.headline6,
        )
      ),
      body: BlocProvider(
        create: ( _ ) => GuestBloc(
          repository: context.read<GuestRepositoryImpl>(),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              GuestHeaderForm(),
              GuestBodyForm(),
            ],
          ),
        ),
      ),
    );
  }
}
