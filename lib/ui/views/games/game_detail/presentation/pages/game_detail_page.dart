import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/ui/views/games/game_detail/data/repositories/games_detail_repository_impl.dart';
import 'package:games_app/ui/views/games/game_detail/presentation/bloc/game_detail_bloc.dart';
import 'package:games_app/ui/views/games/game_detail/presentation/components/body/game_detail_minimum_requirements.dart';
import 'package:games_app/ui/views/games/game_detail/presentation/components/header/game_detail_header.dart';
import 'package:games_app/ui/views/games/game_detail/presentation/components/body/game_detail_list_images.dart';
import 'package:iconsax/iconsax.dart';

class GameDetailPage extends StatelessWidget {
  const GameDetailPage({
    Key? key,
    required this.id
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameDetailBloc(
        repository: context.read<GameDetailRepositoryImpl>()
      )..add(GameDetailEvent.getGameById(id)),
      child: const GameDetailView(),
    );
  }
}

class GameDetailView extends StatelessWidget {
  const GameDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Theme.of(context).textTheme.subtitle1!.color;
    return Scaffold(body: BlocBuilder<GameDetailBloc, GameDetailState>(
      builder: (context, state) {
        final game = context.read<GameDetailBloc>().gameDetail;
        return state.when(
          loading: () => Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).textTheme.subtitle1!.color,
              strokeWidth: 1.5,
            ),
          ),
          success: () => CustomScrollView(
            slivers: [
              GameDetailHeader(game: game),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0
                  ),
                  child: Text(
                    game.title,
                    style: TextStyle(
                      color: primaryTextColor,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      color: primaryTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    game.description,
                    style: TextStyle(
                      color: primaryTextColor,
                      fontSize: 15,
                    ),
                  ),
                )
              ),
              if (game.minimumSystemRequirements.os != null) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GameDetailMinimumRequirements(
                      minimum: game.minimumSystemRequirements
                    ),
                  ),
                ),
              ],
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Screenshots',
                    style: TextStyle(
                      color: primaryTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ),
              SliverToBoxAdapter(
                child: GameDetailListImages(
                  screenshots: game.screenshots,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                ),
              ),
            ],
          ),
          failed: () => Center(
              child: Icon(
            Iconsax.warning_2,
            color: Colors.grey.shade400,
          )),
          notFound: () => Center(
              child: Icon(
            Iconsax.people,
            color: Colors.grey.shade400,
          )),
        );
      },
    ));
  }
}
