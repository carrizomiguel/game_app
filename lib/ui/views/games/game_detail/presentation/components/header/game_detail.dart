import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:games_app/ui/views/games/game_detail/data/models/game_detail_model.dart';
import 'package:games_app/ui/views/games/game_detail/presentation/components/header/game_detail_photos.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class GameDetailSlider extends StatelessWidget {
  const GameDetailSlider({ 
    Key? key,
    required this.topPercent,
    required this.bottomPercent,
    required this.model,
  }) : super(key: key);

  final double topPercent;
  final double bottomPercent;

  final GameDetailModel model;
  // final String publisher;
  // final String date;
  // final String platform;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final secondaryColor = Theme.of(context).backgroundColor;
    final primaryColor = Theme.of(context).primaryColor;
    final primaryTextColor = Theme.of(context).textTheme.subtitle1!.color;
    final dateString = DateFormat("yyyy-MM-dd").format(model.releaseDate);
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRect(
          child: Padding(
            padding: EdgeInsets.only(
              top: (20 + topPadding) * (1 - bottomPercent),
              bottom: 220 * (1 - bottomPercent)
            ),
            child: Transform.scale(
              scale: lerpDouble(1, 1.3, bottomPercent)!,
              child: GameDetailPhotos(
                imgs: model.screenshots
              ),
            ),
          ),
        ),
        Positioned(
          top: topPadding,
          left: 0,
          child: BackButton(
            color: primaryTextColor,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Positioned.fill(
          top: null,
          child: Container(
            height: 210,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.blue,
                                  Colors.green
                                ]
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                model.genre,
                                style: const TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold
                                )
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Published $dateString',
                            style: TextStyle(
                              color: primaryTextColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      if (model.platform.contains('Web')) ...[
                        SvgPicture.asset(
                          'assets/icons/web.svg',
                          color: primaryTextColor,
                          height: 20,
                        ),
                      ],
                      if (model.platform.contains('Windows')) ...[
                        const SizedBox(width: 10,),
                        SvgPicture.asset(
                          'assets/icons/windows.svg',
                          color: primaryTextColor,
                          height: 20,
                        )
                      ]
                    ],
                  ),
                ),
                const Spacer()
              ],
            )
          ),
        ),
        Positioned.fill(
          top: null,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Iconsax.people,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Text(
                      model.publisher,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
              ),
            )
          ),
        )
      ],
    );
  }
}