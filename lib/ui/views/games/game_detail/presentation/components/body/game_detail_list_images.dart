import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:games_app/ui/views/games/game_detail/data/models/game_detail_model.dart';
import 'package:games_app/ui/widgets/shimmer/shimmer_image_loader.dart';
import 'package:iconsax/iconsax.dart';

class GameDetailListImages extends StatelessWidget {
  const GameDetailListImages({
    Key? key,
    required this.screenshots,
  }) : super(key: key);

  final List<ScreenshotsModel> screenshots;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 350,
        shrinkWrap: true,
        itemCount: screenshots.length,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: screenshots[index].image,
            imageBuilder: (context, imageProvider) {
              return Container(
                margin: EdgeInsets.only(
                  left: index == 0 ? 10 : 0,
                  right: 10
                ),
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
              );
            },
            placeholder: (context, url) {
              return const ShimmerImageLoader(
                height: 100,
                borderRadius: 10,
                margin: EdgeInsets.only(
                  left: 10,
                ),
              );
            },
            errorWidget: (context, url, error) => Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.warning_2,
                    color: Colors.grey.shade400,
                    size: 40,
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    'Image Not Found!',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}