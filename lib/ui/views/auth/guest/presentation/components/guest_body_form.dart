import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:games_app/ui/views/auth/guest/presentation/bloc/guest_bloc.dart';
import 'package:games_app/ui/views/games/games_list/presentation/pages/games_list_page.dart';
import 'package:games_app/ui/widgets/buttons/auth/guest/guest_auth_continue_button.dart';
import 'package:games_app/ui/widgets/inputs/auth/guest/guest_input_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/ui/widgets/snackbars/snackbar.dart';

class GuestBodyForm extends StatelessWidget {
  const GuestBodyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            FadeInDown(
              child: GuestInputName(
                controller: nameController,
                onSaved: (value) {
                  nameController.text = value!;
                },
              ),
              delay: const Duration(milliseconds: 500),
            ),
            const SizedBox(height: 20),
            BlocConsumer<GuestBloc, GuestState>(
              listener: (context, state) {
                state.when(
                  initial: () {},
                  loading: () {},
                  success: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: ( _ ) => const GamesPage()
                    ), (Route<dynamic> route) => false);
                  },
                  failed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      errorSnackbar('Error Ocurred!')
                    );
                  }
                );
              },
              builder: (context, state) {
                return state.when(
                  initial: () => FadeInDown(
                    child: GuestAuthContinueButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        final form = formKey.currentState;
                        if (form!.validate()) {
                          form.save();
                          context
                              .read<GuestBloc>()
                              .add(GuestEvent.nameSubmitted(
                                nameController.text
                              ));
                        }
                      }
                    ),
                    delay: const Duration(milliseconds: 500),
                  ),
                  loading: () => CircularProgressIndicator(
                    color: Theme.of(context).textTheme.subtitle1!.color,
                    strokeWidth: 1.5,
                  ),
                  success: () => GuestAuthContinueButton(
                    onPressed: () => null
                  ),
                  failed: () => GuestAuthContinueButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      final form = formKey.currentState;
                      if (form!.validate()) {
                        form.save();
                        context
                            .read<GuestBloc>()
                            .add(GuestEvent.nameSubmitted(
                              nameController.text
                            ));
                      }
                    }
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
