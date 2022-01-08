import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/ui/views/games/game_detail/presentation/pages/game_detail_page.dart';
import 'package:games_app/ui/views/games/games_list/presentation/bloc/games_bloc.dart';
import 'package:games_app/ui/views/games/games_list/presentation/components/game_list_item.dart';
import 'package:iconsax/iconsax.dart';

class GamesList extends StatelessWidget {
  const GamesList({
    Key? key ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GamesBloc, GamesState>(
      builder: (context, state) {
        final games = context.read<GamesBloc>().gamesList;
        return state.when(
          loading: () => SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).textTheme.subtitle1!.color,
                strokeWidth: 1.5,
              ),
            ),
          ),
          success: () => games.isEmpty
              ? SliverFillRemaining(
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/games/element_not_found.png',
                        width: 250
                      ),
                      const SizedBox(height: 15,),
                      Text(
                        'Sorry! Games\nNot Found',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.subtitle1!.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                )
              )
              : SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(
                    games.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(pageBuilder: (_, animation, __) {
                            return FadeTransition(
                              opacity: animation,
                              child: GameDetailPage(
                                id: games[index].id
                              ),
                            );
                          })
                        );
                      },
                      child: GameListItem(
                        item: games[index],
                      ),
                    ),
                  )
                ),
              ),
          failed: () => SliverToBoxAdapter(
            child: Center(
              child: Icon(
                Iconsax.warning_2,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        );
      },
    );
  }
}