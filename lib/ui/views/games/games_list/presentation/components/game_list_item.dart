import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:games_app/ui/views/games/games_list/data/models/game_model.dart';
import 'package:games_app/ui/widgets/shimmer/shimmer_image_loader.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class GameListItem extends StatelessWidget {
  const GameListItem({
    Key? key,
    required this.item
  }) : super(key: key);

  final GameModel item;

  @override
  Widget build(BuildContext context) {
    final dateString = DateFormat("yyyy-MM-dd").format(item.releaseDate);
    return CachedNetworkImage(
      imageUrl: item.thumbnail,
      imageBuilder: (context, imageProvider) => Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.black45,
              BlendMode.darken
            )
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Iconsax.people,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.publisher.length > 15
                          ? '${item.publisher.substring(0, 15)}...'
                          : item.publisher,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),
                    ),
                    Text(
                      'Published $dateString',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                if (item.platform.contains('Web')) ...[
                  SvgPicture.asset(
                    'assets/icons/web.svg',
                    color: Colors.white,
                    height: 20,
                  )
                ],
                if (item.platform.contains('Windows')) ...[
                  const SizedBox(width: 10,),
                  SvgPicture.asset(
                    'assets/icons/windows.svg',
                    color: Colors.white,
                    height: 20,
                  )
                ]
              ],
            ),
            const SizedBox(height: 15),
            Text(
              item.title.length > 15
                  ? '${item.title.substring(0, 15)}...'
                  : item.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            const SizedBox(height: 15),
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
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  item.genre,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              item.shortDescription,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15
              )
            )
          ],
        ),
      ),
      placeholder: (
        context,
        url
      ) => const ShimmerImageLoader(
        height: 250,
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        borderRadius: 10,
      ),
      errorWidget: (context, url, error) => Icon(
        Iconsax.warning_2,
        color: Colors.grey.shade400,
      ),
    );
  }
}