import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/core/network/network_info.dart';
import 'package:games_app/ui/shared/themes/themes.dart';
import 'package:games_app/ui/views/auth/bloc/auth_navigation_bloc.dart';
import 'package:games_app/ui/views/auth/guest/data/datasources/guest_local_data_source.dart';
import 'package:games_app/ui/views/auth/guest/data/repositories/guest_repository_impl.dart';
import 'package:games_app/ui/views/auth/pages/on_boarding_page.dart';
import 'package:games_app/ui/views/games/game_detail/data/datasources/game_detail_local_data_source.dart';
import 'package:games_app/ui/views/games/game_detail/data/datasources/game_detail_remote_data_source.dart';
import 'package:games_app/ui/views/games/game_detail/data/repositories/games_detail_repository_impl.dart';
import 'package:games_app/ui/views/games/games_list/data/datasources/games_local_data_source.dart';
import 'package:games_app/ui/views/games/games_list/data/datasources/games_remote_data_source.dart';
import 'package:games_app/ui/views/games/games_list/data/repositories/games_repository_impl.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'ui/shared/themes/bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory()
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Get Storage
    final storage = GetStorage();
    // Network Info
    final networkInfo = NetworkInfoImpl();

    // Guest Repository
    final guestLocalDataSource = GuestLocalDataSourceImpl(
      box: storage
    );

    // Games Repository
    final gamesLocalDataSource = GamesLocalDataSourceImpl(
      box: storage
    );
    final gamesRemoteDataSource = GamesRemoteDataSourceImpl();

    // Games Detail Repository
    final gameDetailLocalDataSource = GameDetailLocalDataSourceImpl(
      box: storage
    );
    final gameDetailRemoteDataSource = GameDetailRemoteDataSourceImpl();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GuestRepositoryImpl>(
          create: ( _ ) => GuestRepositoryImpl(
            localDataSource: guestLocalDataSource
          )
        ),
        RepositoryProvider<GamesRepositoryImpl>(
          create: ( _ ) => GamesRepositoryImpl(
            localDataSource: gamesLocalDataSource,
            remoteDataSource: gamesRemoteDataSource,
            networkInfo: networkInfo
          )
        ),
        RepositoryProvider<GameDetailRepositoryImpl>(
          create: ( _ ) => GameDetailRepositoryImpl(
            localDataSource: gameDetailLocalDataSource,
            remoteDataSource: gameDetailRemoteDataSource,
            networkInfo: networkInfo
          )
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider(
            create: (context) => AuthNavigationBloc()
          ),
        ],
        child: const ThemedApp(),
      ),
    );
  }
}

class ThemedApp extends StatelessWidget {
  const ThemedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Free to Play App',
          home: const OnBoardingPage(),
          theme: state.when(
            light: () => kLightTheme,
            dark: () => kDarkTheme,
          ),
          darkTheme: kDarkTheme,
        );
      },
    );
  }
}
