import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/ui/views/games/games_list/data/repositories/games_repository_impl.dart';
import 'package:games_app/ui/views/games/games_list/presentation/bloc/games_bloc.dart';
import 'package:games_app/ui/views/games/games_list/presentation/components/games_list.dart';
import 'package:games_app/ui/views/games/games_list/presentation/components/list_filter_dialog.dart';
import 'package:games_app/ui/views/user/presentation/pages/user_page.dart';
import 'package:games_app/ui/widgets/inputs/games/search_input.dart';
import 'package:iconsax/iconsax.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GamesBloc(
        repository: context.read<GamesRepositoryImpl>()
      )..add(const GamesEvent.getGamesList()),
      child: const GamesView(),
    );
  }
}

class GamesView extends StatefulWidget {
  const GamesView({Key? key}) : super(key: key);

  @override
  State<GamesView> createState() => _GamesViewState();
}

class _GamesViewState extends State<GamesView> {
  final _scrollController = ScrollController();
  bool _showScrollToTopButton = false;
  bool _showAnimation = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset > 400) {
          _showScrollToTopButton = true;
          _showAnimation = true;
        } else {
          _showScrollToTopButton = false;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).textTheme.subtitle1!.color;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: SearchInput(
                          onChanged: (value) {
                            context
                                .read<GamesBloc>()
                                .add(GamesEvent.searchGame(value));
                          },
                        )),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (newContext) {
                                  return BlocProvider.value(
                                    value: BlocProvider.of<GamesBloc>(context),
                                    child: const ListFilterDialog(),
                                  );
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Icon(
                              Iconsax.setting_4,
                              color: Colors.white,
                            ),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ]),
                ),
              ),
              pinned: true,
              floating: false,
              expandedHeight: 180,
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Theme.of(context).primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Find a\nfree game',
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const UserPage()));
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        child: const Icon(
                          Iconsax.user,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            const GamesList()
          ],
        ),
      ),
      floatingActionButton: _showScrollToTopButton
          ? FadeInRight(
              child: FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn);
              },
              child: const Icon(
                Iconsax.arrow_up_2,
                color: Colors.white,
              ),
              backgroundColor: Colors.blue,
            ))
          : _showAnimation
              ? FadeOutRight(
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(
                      Iconsax.arrow_up_2,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  animate: !_showScrollToTopButton,
                )
              : null,
    );
  }
}
