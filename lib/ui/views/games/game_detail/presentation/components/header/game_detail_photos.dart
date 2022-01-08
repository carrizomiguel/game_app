import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:games_app/ui/views/games/game_detail/data/models/game_detail_model.dart';
import 'package:games_app/ui/widgets/shimmer/shimmer_image_loader.dart';
import 'package:iconsax/iconsax.dart';

class GameDetailPhotos extends StatelessWidget {
  const GameDetailPhotos({
    Key? key ,
    required this.imgs,
  }) : super(key: key);

  final List<ScreenshotsModel> imgs;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).textTheme.subtitle1!.color;
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: imgs.length,
            physics: const BouncingScrollPhysics(),
            controller: PageController(viewportFraction: .9),
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: imgs[index].image,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                          Colors.black26, 
                          BlendMode.darken
                        )
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10
                        )
                      ]
                    ),
                  );
                },
                placeholder: (context, url) {
                  return const ShimmerImageLoader(
                    height: 200,
                    borderRadius: 20,
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
                    borderRadius: BorderRadius.circular(20)
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
            }
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imgs.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              color: primaryColor,
              height: 3,
              width: 10,
            )
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}