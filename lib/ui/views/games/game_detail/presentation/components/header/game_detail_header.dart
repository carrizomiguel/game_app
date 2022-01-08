import 'package:flutter/material.dart';
import 'package:games_app/ui/views/games/game_detail/data/models/game_detail_model.dart';
import 'package:games_app/ui/views/games/game_detail/presentation/components/header/game_detail.dart';

class GameDetailHeader extends StatelessWidget {
  const GameDetailHeader({
    Key? key,
    required this.game,
  }) : super(key: key);

  final GameDetailModel game;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: BuilderPersistentDelegate(
        maxExtent: MediaQuery.of(context).size.height, 
        minExtent: MediaQuery.of(context).size.height * .7, 
        builder: (percent) {
          return GameDetailSlider(
            topPercent: ((1 - percent) / .7).clamp(0.0, 1.0),
            bottomPercent: (percent / .3).clamp(0.0, 1.0),
            model: game,
          );
        }
      ),
    );
  }
}

class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate {
  BuilderPersistentDelegate({
    required double maxExtent, 
    required double minExtent, 
    required this.builder
  }): _maxExtent = maxExtent, _minExtent = minExtent;

  final double _maxExtent;
  final double _minExtent;
  final Function(double percent) builder;

  @override
  Widget build(
    BuildContext context, 
    double shrinkOffset, 
    bool overlapsContent
  ) {
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(
    covariant SliverPersistentHeaderDelegate oldDelegate
  ) => false;
}