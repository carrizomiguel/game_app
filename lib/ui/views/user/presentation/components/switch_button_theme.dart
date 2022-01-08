import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/ui/shared/themes/bloc/theme_bloc.dart';
import 'package:games_app/ui/shared/themes/themes.dart';

class SwitchButtonTheme extends StatefulWidget {
  const SwitchButtonTheme({
    Key? key,
  }) : super(key: key);

  @override
  _SwitchButtonThemeState createState() => _SwitchButtonThemeState();
}

class _SwitchButtonThemeState extends State<SwitchButtonTheme> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ThemeBloc>();

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return DayNightSwitcherIcon(
          isDarkModeEnabled: state.when(
            light: () => false, 
            dark: () => true
          ),
          onStateChanged: (bool isDarkModeEnabled) {
            debugPrint('DarkMode =====> ${isDarkModeEnabled.toString()}');
            bloc.add(ThemeEvent.changeTheme(
                isDarkModeEnabled ? ThemeApp.dark : ThemeApp.light));
          },
        );
      },
    );
  }
}
